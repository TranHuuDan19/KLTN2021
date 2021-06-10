function [ output_args ] = TrangThai( input_args )

output_args = 0;
fileID = fopen('TrangThai.dat','w');
if input_args==0
    fprintf(fileID,'%s','VUI=> xe dung lai');
end
if input_args==1
    fprintf(fileID,'%s','Binh Thuong => xe chay toi');
end
if input_args==2
    fprintf(fileID,'%s','Ngac Nhien => xe quay phai');
end

end

