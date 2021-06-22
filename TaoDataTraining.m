bienDemDataTraining=3000;
save('bienDemDataTraining.mat','bienDemDataTraining');
load('bienDemDataTraining.mat');
strTrainPathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\tam';
strLabelFileName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\InfoData.dat';
fullName = dir(strTrainPathName);
fileID = fopen('InfoData.dat','w');
leng=length(fullName);

for i=1:leng
    fileName = fullName(i).name;
    fprintf(fileID,'%s \n',fileName  );
end
fclose(fileID);

%doc du lieu train
fid=fopen(strLabelFileName);
imageTrainingLabel=textscan(fid,'%s');
fclose(fid);

for m=3:length(imageTrainingLabel{1,1})
    TrainingImagesLoad{m,1} = strcat(strTrainPathName,'\',imageTrainingLabel{1,1}(m));
end

imageSize=[60,60];
length(imageTrainingLabel{1,1})
for k=3:length(imageTrainingLabel{1,1})
    capCha          = imread(char(TrainingImagesLoad{k,1}));
    videoFrame      = capCha;
    FaceDetect      = vision.CascadeObjectDetector;
    imageFaceDetect = step(FaceDetect,videoFrame);
    for i=1:size(imageFaceDetect,1)
        sizeImageFaceDetect = imageFaceDetect(i,3)*imageFaceDetect(i,4);
        if sizeImageFaceDetect > 7200
            i1= size(imageFaceDetect,1);    
            J=imcrop(videoFrame,[imageFaceDetect(i1,1),imageFaceDetect(i1,2),imageFaceDetect(i1,3),imageFaceDetect(i1,4)+15]);
            [x y]=size(J(:,:,1));
            MouthDetect      = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
            imageMouthDetect = step(MouthDetect,J);
            j                = size(imageMouthDetect,1);
            if (j>1)
                maxValue = max(imageMouthDetect(:,2));
                [ik jk]= find(imageMouthDetect(:,2)== maxValue);
                if imageMouthDetect(ik,2)>x/2
                    if imageMouthDetect(ik,2)<0.65*x
                        I  = imcrop(J,[imageMouthDetect(ik,1),imageMouthDetect(ik,2)-10+x/15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)]);
                        I  = imresize(I,imageSize)
%                       figure(2), imshow(I);
                        pathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\DataTesting\';
                        fileName = [pathName num2str(bienDemDataTraining) '.jpg'];
                        imwrite(I,fileName);
                        bienDemDataTraining = bienDemDataTraining+1;
                        save('bienDemDataTraining.mat','bienDemDataTraining');
                    else
                        I=imcrop(J,[imageMouthDetect(ik,1),imageMouthDetect(ik,2)-10,imageMouthDetect(ik,3),imageMouthDetect(ik,4)]);
                        I=imresize(I,imageSize)
%                       figure(2), imshow(I);
                        pathName='C:\Users\Admin\Desktop\KLTN\KLTN2021\DataTesting\';
                        filename=[pathName num2str(bienDemDataTraining) '.jpg'];
                        imwrite(I,filename);
                        bienDemDataTraining=bienDemDataTraining+1;
                        save('bienDemDataTraining.mat','bienDemDataTraining');
                    end            
            elseif j==1
                if imageMouthDetect(1,2) > x/2
                    if imageMouthDetect(1,2) < 0.65*x
                        I  = imcrop(J,[imageMouthDetect(1,1),imageMouthDetect(1,2)-10+x/15,imageMouthDetect(1,3),imageMouthDetect(1,4)]);
                        I  = imresize(I,imageSize)
%                       figure(2),imshow(I);
                        pathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\DataTesting\';
                        filename = [pathName num2str(bienDemDataTraining) '.jpg'];
                        imwrite(I,filename);
                        biendem_datatraining=biendem_datatraining+1;
                        save('bienDemDataTraining.mat','bienDemDataTraining');
                    else
                        I  = imcrop(J,[imageMouthDetect(1,1),imageMouthDetect(1,2)-10,imageMouthDetect(1,3),imageMouthDetect(1,4)]);
                        I  = imresize(I,imageSize)
%                       figure(2), imshow(I);
                        pathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\DataTesting\';
                        fileName = [pathName num2str(bienDemDataTraining) '.jpg'];
                        imwrite(I,fileName);
                        biendem_datatraining = biendem_datatraining + 1;
                        save('bienDemDataTraining.mat','bienDemDataTraining');
                    end      
                end
                end
            end
       end
    end
end
