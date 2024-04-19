center = input('请输入正中心小区的索引(一维): ');

row = floor(center/100);
col = center - row*100;

sx = row-4;
ex = row+5;

sy = col-4;
ey = col+5;

[p,q,r] = size(data);
center_data = squeeze(data(:,center,:));

for i = 1:p
    corr_mat = zeros(ex-sx+1,ey-sy+1);
    
    center_business = squeeze( center_data(i,:));
    
    for j = sx:ex
        for k = sy:ey
            neighbour = j*100+k;
            neighbour_business = squeeze( data(i,neighbour,:) );
            
            coef_mat = corrcoef(transpose(center_business),transpose(neighbour_business));
            corr_mat(j-sx+1,k-sy+1) = coef_mat(1,2);
           
        end
    end
    
    figure;

    x_values = string(sx:ex);
    y_values = string(sy:ey);

    h = heatmap(x_values,y_values,corr_mat);
    h.Title = sprintf('Pearson Coeff Mat based on %d:business %d',center,i);
    h.XLabel = 'region row';
    h.YLabel = 'region col';
    
    saveas(gcf,sprintf('D:\\workSpace\\BigDataLabs\\matlab_labs\\Data_visualization\\lab\\target\\Pearson_Coeff_based_on_%d_business_%d.png',center,i),'png')
   
end