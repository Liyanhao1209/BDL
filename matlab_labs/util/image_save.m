function [filename] = image_save(filename,target_dir,format)
    disp(filename)
    
    filename = fullfile(target_dir,filename);
    
    % ȷ��Ŀ¼����  
    dir_path = fileparts(filename);  
    if ~exist(dir_path, 'dir')    
        mkdir(dir_path);  % ֻ����Ŀ¼���������ļ�  
    end
    
    disp(filename)
    saveas(gcf,filename,format)
end

