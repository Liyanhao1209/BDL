center = input('请输入正中心小区的索引(一维): ');

row = ceil(center/100);
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
            
            corr_mat(j-sx+1,k-sy+1) = corrcoef(transpose(center_business),transpose(neighbour_business));
        end
    end
end
