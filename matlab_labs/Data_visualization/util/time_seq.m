function [] = time_seq(business,region,st,et,data,target_dir)
    arr = data(business,region,st:et);
    arr = ArrayCopy1D(arr);
    
    figure
    plot(arr)
    
    title(sprintf("��%dҵ������ʱ������ͼ",business))
    xlabel(sprintf('ʱ��(��10����Ϊ��λ,��%d��ʼ)',st))
    ylabel('����')
    
    image_save(gcf,sprintf('%d %d %d_%d.png',business,region,st,et),target_dir,'png')
    
end

