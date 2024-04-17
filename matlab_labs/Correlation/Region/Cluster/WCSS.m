function [] = WCSS(region,k_max)
    % ����ά����ת��Ϊһά����
    region_1d = region(:);
    
    % ���ݱ�׼��
    region_std = (region_1d - mean(region_1d)) / std(region_1d);
    
    % ��ʼ�� wcss ����
    wcss = zeros(1, k_max);
    
    % ʹ���ⲿ����ȷ��������Ŀ
    for k = 1:k_max
        [cluster_idx_1d, cluster_center] = kmeans(region_std, k, 'Replicates', 3);
        
        % ���� WCSS
        for j = 1:k
            cluster_points = region_1d(cluster_idx_1d == j);
            cluster_center_j = cluster_center(j, :);
            within_cluster_sum = sum((cluster_points - cluster_center_j).^2, 2);
            wcss(k) = wcss(k) + sum(within_cluster_sum);
        end
    end
    
    % �����ⲿ����ͼ
    plot(1:k_max, wcss);
    xlabel('Number of clusters (k)');
    ylabel('Within-cluster sum of squares (WCSS)');
    title('Elbow Method');
    hold on;
end

