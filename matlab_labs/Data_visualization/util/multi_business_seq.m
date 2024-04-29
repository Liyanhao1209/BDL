function [] = multi_business_seq(data,st,region)
    % ��ȡҵ�����������������ʱ����������������  
    num_businesses = size(data, 1);  
    num_timepoints = size(data, 2);  

    % ����һ���µ�ͼ�δ���  
    figure;  

    % ��ʼ��hold on���Ա���ͬһ��ͼ�ϻ��ƶ������ͼ  
    hold on;  

    % ���ò�ͬ����ɫ�Ա����ֲ�ͬ��ҵ��  
    colors = hsv(num_businesses); % ʹ��HSV��ɫ�ռ����ɲ�ͬ��ɫ  

    % ����ÿ��ҵ�񣬻���������ʱ������  
    for i = 1:num_businesses  
    % ���Ƶ�i��ҵ�������ʱ�����У�ֻʹ��ʵ�ߣ���ʹ�ñ��  
    plot(1:num_timepoints, data(i, :), 'Color', colors(i, :), '-'); % ָ����ɫΪcolors(i,:)  
    end  



    % Ϊÿ��ҵ�������ͼ���ͼ��  
    legend_strings = cellstr(arrayfun(@(x) sprintf('ҵ�� %d', x), 1:num_businesses, 'UniformOutput', false));  
    legend(legend_strings, 'Location', 'NorthWest'); % ��ͼ������ͼ�����Ͻ�  

    % �ر�hold on���Ա������ͼ����������ӵ���ǰͼ��  
    hold off;  

    % ��ʾ���񣨿�ѡ��  
    grid on;
end

    % ����ͼ�ı�����������ǩ  
    title(sprintf('��%С��dҵ������ʱ������',region));  
    xlabel(sprintf('ʱ���(�ӵ�%d��ʱ��㿪ʼ)',st));  
    ylabel('����');

