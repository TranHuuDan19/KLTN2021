function [ isSucceed ] = EigenFace()
    isSucceed=0;
    strTrainPath = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\DataTraining';
    strLabelFile = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\DataTraining.dat';
    soMau=3000;
    %doc du lieu train
    fid=fopen(strLabelFile);
    imageLabel=textscan(fid,'%s %s');
    fclose(fid);
    numImage = length(imageLabel{1,1})
    for i=1:numImage
        TrainImages{i,1} = strcat(strTrainPath,'\',imageLabel{1,1}(i));
    end
    
    imageSize =[60,60];
    % load train data
    image = zeros(imageSize(1)*imageSize(2),numImage);
    for i = 1:numImage
        readImageFromFile = char(TrainImages{i,1});
        readImage         = imread(readImageFromFile);
        imageResize       = imresize(readImage,imageSize);
        imageConvertGray  = rgb2gray(imageResize);
        finalImage        = histeq(uint8(imageConvertGray));
        image(:,i)=finalImage(:);
        sprintf('Loading Train Image From DataTraining:%d',i)
    end
    meanImage  = mean(image,2);% trung binh mau
    image      =(image-meanImage*ones(1,numImage))'; % dau vao PCA
    [C,S,L]    = princomp(image,'econ');%performing PCA
    EigenRange = 1:(soMau-1);% tuy vao so luong dau vao
    C = C(:,EigenRange);
    figure(3), imshow(finalImage);
    figure(4), imshow(readImage);
    figure(5), imshow(imageConvertGray);
save('soMau.mat','soMau');
save('C.mat','C');
save('S.mat','S');
save('L.mat','L');
save('imageLabel.mat','imageLabel');
save('meanImage.mat','meanImage');