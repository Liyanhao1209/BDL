function [cluster_idx, cluster_centers] = K_Means_2D(data,business,k) 
    data = data(business,:,:);
    [num_business, num_regions, num_timepoints] = size(data);  
      
    % ����ά����ת��Ϊ��ά���飬ÿ����һ������������ҵ��������ʱ������������ֵ  
    % ÿ�������� num_business * num_timepoints ������  
    num_features_per_region = num_business * num_timepoints;  
    features = reshape(data, num_regions, num_features_per_region);  
      
    [cluster_idx, cluster_centers] = kmeans(features, k);  
      
    % ���־�����Ϊһά����  
    cluster_idx = reshape(cluster_idx, [100,100]);
end

