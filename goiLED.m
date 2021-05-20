function [ output_args ] = goiLED(LedValueInput)
output_args=0;
x = serial('COM9');
int = LedValueInput;
if strcmp(int, 'NULL')==1
    LedValue = 0;
    TrangThai(LedValue);
end
if strcmp(int, 'Binh_Thuong')==1
    LedValue = 1;
    TrangThai(LedValue);
end
if strcmp(int, 'Vui')==1
    LedValue = 2;
    TrangThai(LedValue);
end
if strcmp(int, 'Ngac_Nhien')==1
    LedValue = 3;
    TrangThai(LedValue);
end
save('LedValue.mat','LedValue');
load('LedValue.mat');
 b = LedValue
fopen(x)
       pause(2);
       fprintf(x,b);   
fclose(x)
end
