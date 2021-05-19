%read and write an image from file
fullVui    = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\Vui\*.jpg');
fullBth    = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\BinhThuong\*.jpg');
fullNn     = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\Ngacnhien\*.jpg');

fileID = fopen('DataTraining.dat','w');
for i=1:length(fullVui)
    fprintf(fileID,'%20s %5s\n',fullVui(i).name,' Vui ' );
end
for i=1:length(fullBth)
    fprintf(fileID,'%10s %5s \n',fullBth(i).name,' Binh_Thuong '  );
end
for i=1:length(fullNn)
    fprintf(fileID,'%20s %5s\n',fullNn(i).name,' Ngac_Nhien '   );
end
fclose(fileID);
