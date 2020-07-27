% SOM analysis of monthly mean spatio-temporal water quality data
% 
% Copyright 2020 by
% Yu Jiang, Institute of Water Sciences, College of Engineering, Peking University


[data,txt]=xlsread('data\surface water.xlsx','spatiotemporal_data');
[~,~,raw1]=xlsread('data\surface water.xlsx','station');

TABLE=tabulate(data(:,27));%This is station number

variable=19;%This represents the column number of selected water quality,which could be found in variable txt. 
%19 represents Nitrate Nitrogen; 24 represents Chlorophyll-a; 


newdata=zeros(277,94);% spatio-temporal data for specified water quality variable
t=0;
s=1;
for i=1:length(TABLE)
    t=t+TABLE(i,2);
    if TABLE(i,2)>=276 % The station's temporal records need to be larger than 276. 
        newdata(2:277,s)=data(t-276+1:t,variable);
        newdata(1,s)=data(t,27);
        s=s+1;
    end
end

label1=cell(1,(s-1));% station name label
for i=1:(s-1)
    label1{1,i}=(raw1(newdata(1,i)+1));
end 

monthdata=zeros(12,s-1);% monthly mean data
labely=cell(12,1);% month label
for i=1:(s-1)
    for j=1:12
        monthdata(j,i)=sum(newdata(j+1:12:(23*12+1),i))/23;
    end
end

for i=1:12
    date = datetime(2014,i,1);
    labely{i,1} = month(date,'shortname');
end

D=monthdata;% temporal SOM analysis
sData = som_data_struct(D,'name','location_data','comp_names',label1);
sData = som_label(sData,'add',1:12,labely);
sD = som_normalize(sData,'var');

sMap = som_make(sD,'msize',[5,3]);
sM = som_autolabel(sMap,sD,'add');%vote,add

h2=zeros(15,1);
for i=1:15
    if (isequal( sM.labels{i,1},''))
        h2(i)=2;
    end
end

figure(1)
som_show(sM,'comp',1:(s-1),'norm','d');
colormap(jet)
som_show_add('hit',h2,'MarkerColor','k','Subplot',1:(s-1));


figure(2)
som_show(sM,'umat','all','empty','Labels','norm','d');
colormap(jet)
som_show_add('label',sM,'subplot',2);
h = som_hits(sM,sD);
som_show_add('hit',h,'MarkerColor','k','Subplot',1);

figure(3)
[Pd2,V2,me2,l2] = pcaproj(sM,2);
plot(V2(:,1),V2(:,2),'o');
title('temporal-data water quality Variable PCA');
for i=1:(s-1)
    text(V2(i,1)+0.001,V2(i,2)+0.001,label1{1,i});
end

figure(4)
plot(Pd2(:,1),Pd2(:,2),'o');
title('temporal-data water quality SOM PCA');
for i=1:15
    if (isequal( sM.labels{i,1},''))
        continue
    else
        text(Pd2(i,1)+0.005,Pd2(i,2)+0.005,sM.labels(i,1));
    end
end

D1=D';%spatial SOM analysis
%D1=log10(D');%spatial SOM analysis with log transform
sData1 = som_data_struct(D1,'name','location_data','comp_names',labely');
sData1 = som_label(sData1,'add',1:(s-1),label1');
sD1 = som_normalize(sData1,'var');

sMap1 = som_make(sD1,'msize',[8,5]);
sM1 = som_autolabel(sMap1,sD1,'vote');%vote


figure(5)
som_show(sM1,'comp',1:12,'norm','d');colormap(jet)

figure(6)
som_show(sM1,'umat','all','empty','Labels','norm','d');colormap(jet)
som_show_add('label',sM1,'subplot',2);
h1 = som_hits(sM1,sD1);
som_show_add('hit',h1,'MarkerColor','k','Subplot',1);

figure(7)
[Pd3,V3,me3,l3] = pcaproj(sM1,2);
plot(V3(:,1),V3(:,2),'o');
title('spatial-data water quality Variable PCA');
for i=1:(12)
    text(V3(i,1)+0.001,V3(i,2)+0.001,labely{i,1});
end
hold off

figure(8)
plot(Pd3(:,1),Pd3(:,2),'o');
title('spatial-data water quality SOM PCA');
for i=1:40
    if (isequal( sM1.labels{i,1},''))
        continue
    else
        text(Pd3(i,1)+0.005,Pd3(i,2)+0.04,sM1.labels(i,1));
    end
end



