function [] = Ljung_Box_Q(ts)
    % ��ʱ�����н���Ljung-Box Q����  
    [h, ~, ~, ~] = lbqtest(ts);  

    % ���������  
    if h == 0  
        disp('û��֤�ݱ�������������صġ�');  
    else  
        disp('���п���������صġ�');  
    end
end

