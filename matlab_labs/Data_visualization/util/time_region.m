function [] = time_region(business, st, et, sr, er, data,target_dir)  
    disp(business)
    % ��ȡgrid����  
    grid = data(business, sr:er, st:et);  
    grid = ArrayCopy(grid);
      
    % ������״ͼ  
    figure;  
    bar3(grid);  
        
    % ���ñ�����������ǩ  
    title(sprintf('��%dҵ��ʱ������ͼ', business));  
    xlabel(sprintf('ʱ��(��λ10����,��%d��ʼ)',st));  
    ylabel(sprintf('С������(��%d��ʼ)',sr));  
    zlabel('����');  
      
    % �����ӽ�  
    view(3);  
      
    % �����ļ���  
    png_name = sprintf('%d %d_%d %d_%d.png', business, st, et, sr, er);  
    disp(png_name);  

    % �����������ļ�·��  
    filename = fullfile(target_dir, png_name);    

    % ȷ��Ŀ¼����  
    dir_path = fileparts(filename);  
    if ~exist(dir_path, 'dir')    
        mkdir(dir_path);  % ֻ����Ŀ¼���������ļ�  
    end  

    disp(filename);  

    % ����ͼ��ΪPNG�ļ�  
    saveas(gcf, filename, 'png');
end