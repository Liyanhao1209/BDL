target_dir = 'D:\workSpace\BigDataLabs\matlab_labs\Data_visualization\target\region';
business = input('请输入业务代码:  ');
time_id = input('请输入时间序列id:  ');
sx = input('城区是一个100*100的区块，请输入横轴开始id:  ');
ex = input('请输入横轴结束id:  ');
sy = input('请输入纵轴开始id:  ');
ey = input('请输入纵轴结束id:  ');

region(business,time_id,sx,ex,sy,ey,data,target_dir)