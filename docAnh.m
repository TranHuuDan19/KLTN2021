%read and write an image from file
fullVui    = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\Vui\*.jpg');
fullBuon   = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\Buon\*.jpg');
fullNn     = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\Ngacnhien\*.jpg');

fileID = fopen('DataTraining.dat','w');

for i=1:length(fullNn)
    fprintf(fileID,'%20s %5s\n',fullNn(i).name,' Ngac_Nhien '   );
end
for i=1:length(fullVui)
    fprintf(fileID,'%20s %5s\n',fullVui(i).name,' Vui ' );
end
for i=1:length(fullBuon)
    fprintf(fileID,'%10s %5s \n',fullBuon(i).name,' Buon '  );
end
fclose(fileID);
