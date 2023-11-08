function [Spec_nodes,Kmeans_nodes] = ClusterMetrics(K,x_spec,x_kmeans)

 % 2c) Calculate the number of nodes per cluster (for k-means and spectral
 %     clustering) and plot them in a histogram.

 Spec_nodes = zeros(K, 1);
 Kmeans_nodes = zeros(K, 1);
 for i = 1:K
     Spec_nodes(i) = sum(x_spec == i);
     Kmeans_nodes(i) = sum(x_kmeans == i);
 end


 figure;
 subplot(2,1,1);
 bar(1:K, Spec_nodes);
 xlabel('Clusters');
 ylabel('Number of Nodes');
 title('Number of Nodes Per Cluster, Spectral Clustering');
 
 subplot(2,1,2);
 bar(1:K, Kmeans_nodes);
 bar(Kmeans_nodes, 'grouped');
 xlabel('Clusters');
 ylabel('Number of Nodes');
 title('Number of Nodes Per Cluster, Kmean clustering');

end