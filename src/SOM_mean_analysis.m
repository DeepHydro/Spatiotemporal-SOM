% SOM analysis for long term mean water quality of Hong Kong marine
% 
% Copyright 2020 by
% Yu Jiang, Institute of Water Sciences, College of Engineering, Peking University


[data,txt]=xlsread('data\surface water.xlsx','mean_data') ;

D=data;
sData = som_data_struct(D,'name','location_data','comp_names',txt(1,2:25));
sData = som_label(sData,'add',1:94,txt(2:95,1));
sD = som_normalize(sData,'var');

sMap = som_make(sD,'msize',[12,4]);

sM = som_autolabel(sMap,sD,'vote');%vote,add


figure(1)
title('Components planes of SOM');
som_show(sM,'comp',1:24,'norm','d','subplots',[4,6]);
colormap(jet)

figure(2)
som_show(sM,'umat','all','empty','Labels','norm','d');
colormap(jet)
som_show_add('label',sM,'subplot',2);

h = som_hits(sM,sD);
som_show_add('hit',h,'MarkerColor','k','Subplot',1);

figure(3) %stochastic initial cluster centers
[c, p, err, ind] = kmeans_clusters(sM,7,5,0); % find clusterings
[dummy,i] = min(ind); % select the one with smallest index
plot(1:length(ind),ind,'x-');
som_show(sM,'color',{p{i},sprintf('%d clusters of K-means',i)}); % visualize
colormap(jet(6))

figure(4)
[Pd2,V2,me2,l2] = pcaproj(sM,2); %project the data using odim first eigenvectors
plot(Pd2(:,1),Pd2(:,2),'o');
title('PCA result of SOM neurons');
for i=1:48
    if (isequal( sM.labels{i,1},''))
        continue
    else
        text(Pd2(i,1)+0.005,Pd2(i,2)+0.005,sM.labels(i,1));%manually classify five clusters from this plot
    end
end

figure(5);
som_order_cplanes(sM,'abs(corr)','pca','show','planes');
title('PCA result for water quality variables');



figure(6)
pcopy=xlsread('data\surface water.xlsx','PCA_cluster');%The PCA cluster result from figure 4
som_show(sM,'color',{pcopy,sprintf('%d clusters',5)}); % visualize
%colormap(jet)
colormap([0 0 0;0 0 1;0 1 1;1 1 0;1 0 1;1 0 0])
h1=zeros(48,1);
for i=1:48
    if (isequal( sM.labels{i,1},''))
        h1(i)=2;
    end
end
som_show_add('hit',h1,'MarkerColor','k');


figure(7)
title('Five representative water quality components planes');
som_show(sM,'comp',5,'comp',20,'comp',22,'comp',18,'comp',8,'comp',11,'comp',12,'norm','d');
colormap(jet)
h = som_hits(sM,sD);






