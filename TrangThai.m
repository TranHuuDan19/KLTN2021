function [ output_args ] = TrangThai( input_args )

output_args = 0;
fileID = fopen('TrangThai.dat','w');
if input_args==0
    fprintf(fileID,'%s','NULL=> 3 Led Tat');
end
if input_args==1
    fprintf(fileID,'%s','Binh Thuong => Led Do Sang');
end
if input_args==2
    fprintf(fileID,'%s','Vui => led 7 Mau Sang');
end
if input_args==3
    fprintf(fileID,'%s','Ngac Nhien => Led Trang Sang');
end
end

