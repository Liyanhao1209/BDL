function [] = HeatMapForCluster(cluster_center,cluster_idx)

% �� cluster_idx ת��Ϊ��������Ķ�Ӧ��������С
cluster_size = length(cluster_center);
cluster_value = zeros(size(cluster_idx));
[m,n] = size(cluster_idx);
for i = 1:m
    for j = 1:n
        cluster_value(i,j) = cluster_center(cluster_idx(i,j));
    end
end

% ʹ�� heatmap ����������ͼ
heatmap(cluster_value);

colormap('hot')
colorbar;

grid on
% ���ñ�������ǩ
title('Heatmap of Cluster Centers Based on Traffic Flow');
xlabel('row');
ylabel('col');
end

