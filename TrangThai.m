function [ output_args ] = TrangThai( input_args )

output_args = 0;
fileID = fopen('TrangThai.dat','w');
if input_args==0
    fprintf(fileID,'%s','NULL=> xe dung lai');
end
if input_args==1
    fprintf(fileID,'%s','Vui => xe chay lui');
end
if input_args==2
    fprintf(fileID,'%s','Ngac Nhien => xe quay phai');
end
if input_args==3
    fprintf(fileID,'%s','Binh Thuong => chay toi');
end
end

