function [] = ACF_visual(acf,lags,target_dir)
    % ���������ͼ  
    stem(lags, acf);  
    xlabel('Lags');  
    ylabel('Autocorrelation');  
    title('Autocorrelation Function');  
    grid on;
end

