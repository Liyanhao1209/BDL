function compressed_features = Feature_Compression(cluster_centers)  
    % cluster_centers: �������ľ��󣬴�СΪ [num_clusters, num_features]  
    % compressed_features: ѹ�����������������СΪ [num_clusters, 1]������ÿ�������������ֵ  
      
    % ����ÿ���������������ľ�ֵ  
    num_clusters = size(cluster_centers, 1); % ��ȡ���������  
    compressed_features = mean(cluster_centers); % �������������ľ�ֵ���õ�һ��1x8928��������  
      
    % ��Ϊ������Ҫһ����������Ϊ�����������Ҫת��  
    compressed_features = compressed_features'; % ת���������õ�������  
      
    % ȷ���������������ȷ�����������������ת���Ѿ���֤�ˣ�  
    compressed_features = compressed_features(1:num_clusters); % ��ȡ����ȷ������  
end