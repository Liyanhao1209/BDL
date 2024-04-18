function [data_compressed] = time_seq_compression(data)
    % ���� data ��һ�� p x q x r ����ά����  
    % p ��ҵ��������q �ǵ���������r ��ʱ����������ÿ��ʱ������10���ӣ�  

    % ��ȡ����ĳߴ�  
    [p, q, r] = size(data);  

    % ����ÿ���ʱ���������144��10���ӣ�  
    time_per_day = 144;  

    % ���r�Ƿ���time_per_day��������  
    if mod(r, time_per_day) ~= 0  
        error('ʱ������������ÿ��ʱ���������144������������');  
    end  

    % ��ʼ��һ�����ڴ洢ѹ�������ݵ���ά����  
    data_compressed = zeros(p, q, r/time_per_day);  

    % ����ÿһ������ݣ�����ƽ��ֵ  
    for day = 1:time_per_day:r  
        % ��ȡ��ǰ���ʱ���������Χ  
        idx = (day-1)+1:(day+time_per_day-1);  
        % ��ȡ��ǰ������ݣ���������ҵ��͵�����  
        data_day = squeeze(data(:,:,idx)); % ȥ�����ܵĵ�һά��  
        % ���㵱ǰ���ƽ��ֵ������ʱ��ά�ȣ�  
        data_day_mean = mean(data_day, 3); % 3 ��ʱ��ά�ȵ�����  
        % ������õ���ƽ��ֵ�洢��ѹ�����������  
        data_compressed(:,:,ceil(day/time_per_day)) = data_day_mean;  
    end
end

