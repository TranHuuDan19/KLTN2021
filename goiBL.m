function [ output_args ] = goiBL(LedValueInput)
output_args=0;

global bt;
instrhwinfo('Bluetooth','HC-06');
bt = Bluetooth('HC-06', 1);
int = LedValueInput;
fopen(bt);

if strcmp(int, 'NULL')==1
    fprintf(bt, '0');
end
if strcmp(int, 'Vui')==1
    fprintf(bt, '1');
end
if strcmp(int, 'Ngac_Nhien')==1
    fprintf(bt, '2');
end
if strcmp(int, 'Binh_Thuong')==1
    fprintf(bt, '3');
end
fclose (bt);
end
