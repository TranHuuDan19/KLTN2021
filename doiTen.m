demDatatraining=1001;
save('demDataTraining.mat','demDataTraining');
load('demDataTraining.mat');
strTrainPathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\BaseDataTrain';
strLabelFileName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\InfoData.dat';

fullName = dir('C:\Users\Admin\Desktop\KLTN\KLTN2021\BaseDataTrain');
fileID = fopen('InfoData.dat','w');
leng=length(fullName);

for i=1:leng
    fileName = fullName(i).name;
    fprintf(fileID,'%s \n',fileName  );
end
fclose(fileID);

%doc du lieu train
fid = fopen(strLabelFileName);
imageTrainingLabel = textscan(fid,'%s');
fclose(fid);
leng = length(imageTrainingLabel{1,1});
for m = 1:leng
    TrainingImagesLoad{m,1} = strcat(strTrainPathName,'\',imageTrainingLabel{1,1}(m));
end
for k=3:leng
    I = imread(char(TrainingImagesLoad{k,1}));
    pathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\Buon\';
    fileName = [pathname num2str(demDataTraining) '.jpg'];
    imwrite(I,fileName);
    demDataTraining = demDataTraining + 1;
    save('demDataTraining.mat','demDataTraining');
end