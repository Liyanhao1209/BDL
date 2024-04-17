function [cluster_idx, cluster_center] = K_Means(region,k)
    % ����ά����ת��Ϊһά����
    region_1d = region(:);
    
    % ���ݱ�׼��
    region_std = (region_1d - mean(region_1d)) / std(region_1d);
   
    [cluster_idx_1d, cluster_center] = kmeans(region_std, k, 'Replicates', 3);
    
    % ��һά�ľ�������ӳ���ԭʼ�Ķ�ά������ʽ
    cluster_idx = reshape(cluster_idx_1d, size(region));
end