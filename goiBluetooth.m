 function [ output_args ] = goiBluetooth(Input)
 output_args=0;

global bt;
int = Input;
fopen(bt);

if strcmp(int, 'Vui')==1  % xe dung
    fprintf(bt, '0');  
    TrangThai(0);
end

if strcmp(int, 'Binh_Thuong')==1 % xe chay toi
    fprintf(bt, '1'); 
    TrangThai(1);
end

if strcmp(int, 'Ngac_Nhien')==1 % xe quay phai
    fprintf(bt, '2');
    TrangThai(2);
end

fclose (bt);
end

