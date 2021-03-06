function varargout = mophong(varargin)
%MOPHONG MATLAB code file for mophong.fig
%      MOPHONG, by itself, creates a new MOPHONG or raises the existing
%      singleton*.
%
%      H = MOPHONG returns the handle to a new MOPHONG or the handle to
%      the existing singleton*.
%
%      MOPHONG('Property','Value',...) creates a new MOPHONG using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to mophong_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MOPHONG('CALLBACK') and MOPHONG('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MOPHONG.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mophong

% Last Modified by GUIDE v2.5 20-May-2021 13:25:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mophong_OpeningFcn, ...
                   'gui_OutputFcn',  @mophong_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before mophong is made visible.
function mophong_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
goiLED('NULL');
global CAMON;
load('MODE.mat');
MODE = 2
save('MODE.mat','MODE');
CAMON =0
bienDem   = 1;
bienDem_1 = 1;
save('bienDem.mat','bienDem');
save('bienDem_1.mat','bienDem_1');
demAnh=1;
save('demAnh.mat','demAnh');
load('duLieu.mat');
for i=1:length(data)
            data{i,1}=' ';
            data{i,2}=' ';
            data{i,3}=' ';
save('duLieu.mat','data');
end
% save('dulieu.mat');

% Choose default command line output for mophong
handles.output = hObject;
handles.CAMON = CAMON;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mophong wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mophong_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
% --- Executes on button press in moCamera.
function moCamera_Callback(hObject, eventdata, handles)
% hObject    handle to moCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%show webcam
CAMON = handles.CAMON;
CAMON =1;
CAMON
vid=videoinput('winvideo',1,'YUY2_640x480');
%only capture one frame per trigger, we are not recording a video
vid.FramesPerTrigger=1;
%output would image in RGB color space
vid.ReturnedColorspace='rgb';
%tell matlab to start the webcam on user rewuest, not automatically
triggerconfig(vid,'manual');
%we need this to hnow the image height and width
vidRes=get(vid,'VideoResolution');
%image width
imWidth=vidRes(1);
%image height
imHeight=vidRes(2);
%number of bands of our image(should be 3 because it's RGB)
nBands=get(vid,'NumberOfBands');
%create an empty image container and it on axPreview

hImage=image(zeros(imHeight,imWidth,nBands),'parent',handles.axes1);
%begin the webcam preview
preview(vid,hImage);
handles.vid=vid;
handles.CAMON = CAMON;
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function moCamera_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes on button press in chupAnh.
function chupAnh_Callback(hObject, eventdata, handles)
% hObject    handle to chupAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CAMON = handles.CAMON;
load('MODE.mat');
MODE = 2
save('MODE.mat','MODE');
load('MODE.mat');
CAMON
MODE
if CAMON == 1
    if MODE == 2
        vid = handles.vid;
        axes(handles.axes2);
        cap = getsnapshot(vid);
        imshow(cap);
        handles.capcha = cap;
        guidata(hObject,handles);
    end
else
     f = msgbox('         Hay Mo Camera Cua Ban !!!');
end
 MODE =1;
% --- Executes on button press in themAnh.

guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function chupAnh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chupAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in themAnh.
function themAnh_Callback(hObject, eventdata, handles)
% hObject    handle to themAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('MODE.mat');
MODE = 3
save('MODE.mat','MODE');
load('MODE.mat');
MODE
if MODE == 3
    [fileName,pathName]=uigetfile('*','LOAD AN IMAGE FOR TESTING');
    imageShot = imread(fullfile(pathName,fileName));
    axes(handles.axes2);
    imshow(imageShot);
    handles.capcha = imageShot;
    guidata(hObject,handles);
end
% --- Executes during object creation, after setting all properties.
guidata(hObject,handles);
function themAnh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to themAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in luaData.
function luaData_Callback(hObject, eventdata, handles)
% hObject    handle to luaData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('MODE.mat');
MODE = 0;
save('MODE.mat','MODE');
load('MODE.mat');
if MODE == 0
    valueTest=0;
    load('duLieu.mat');
    for i = 1 :length(data)
        if data{i,1} ~= ' '
            valueTest=valueTest + 1;
        end
    end
    if valueTest == 0
        f = msgbox('            Khong Co Data !');
    else
        xlswrite('data.xls',data);
        f = msgbox('                    Da Luu !');
        end
end
% --- Executes during object creation, after setting all properties.
function luaData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to luaData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in thoat.
function thoat_Callback(hObject, eventdata, handles)
% hObject    handle to thoat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes during object creation, after setting all properties.
function thoat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thoat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ketQua.
function ketQua_Callback(hObject, eventdata, handles)
% hObject    handle to ketQua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('bienDem.mat');
load('bienDem_1.mat');
a=load('C.mat');
b=load('S.mat');
c=load('L.mat');
d=load('imageLabel.mat');
e=load('meanImage.mat');
f=load('soMau.mat');
C=a.C;
S=b.S;
L=c.L;
soMau      = f.soMau;
meanImage  = e.meanImage;
imageLabel = d.imageLabel;
imageSize  = [60,60];
numImage   = size(S,1);
videoFrame      = handles.capcha;
FaceDetect      = vision.CascadeObjectDetector;
imageFaceDetect = step(FaceDetect,videoFrame);
for  i = 1:size(imageFaceDetect,1)
    sizeImageFaceDetect = imageFaceDetect(i,3)*imageFaceDetect(i,4)
    %vung chua khuon mat
    if sizeImageFaceDetect > 7200
        i1    = size(imageFaceDetect,1)
        a     = rectangle('Position',imageFaceDetect(i1,:),'LineWidth',3,'LineStyle','-','EdgeColor','r');
        J     = imcrop(videoFrame,[imageFaceDetect(i1,1),imageFaceDetect(i1,2),imageFaceDetect(i1,3),imageFaceDetect(i1,4)+15]);
        [x y] = size(J(:,:,1));
        MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
        imageMouthDetect = step(MouthDetect,J);
        %tim vung chua mouth
        j = size(imageMouthDetect,1);
        if(j>1)
            maxValue = max(imageMouthDetect(:,2));
            [ik jk]  = find(imageMouthDetect(:,2) == maxValue);
            if imageMouthDetect(ik,2)>x/2
                if imageMouthDetect(ik,2)<0.65*x
                    rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(ik,1),imageFaceDetect(i,2)+imageMouthDetect(ik,2)-15+x/15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');
                    I = imcrop(J,[imageMouthDetect(ik,1),imageMouthDetect(ik,2)-15+x/15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)]);
                    figure(4), imshow(I);
                else
                    rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(ik,1),imageFaceDetect(i,2)+imageMouthDetect(ik,2)-15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');                    
                    I = imcrop(J,[imageMouthDetect(ik,1),imageMouthDetect(ik,2)-15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)]);
                    figure(4), imshow(I);
                end
                %nhan dien cam xuc
            image          = zeros(imageSize(1) * imageSize(2),1);
            imageResize    = imresize(I,imageSize);%cat anh lay khuon mieng
            imageDimension = size(imageResize,3);
            if(imageDimension == 1)
                imageTemp = imageResize;
            else
                imageTemp = rgb2gray(imageResize);
            end
            finalImage    = histeq(uint8(imageTemp));
            image(:,1)    = finalImage(:);% luu hinh test dang cot
            image         = (image-meanImage*ones(1,1))';
            projectedTest = image*C;
            EigenRange    = 1:(soMau-1);
            testImage     = projectedTest(1,:);
            otherTest     = zeros(1,numImage);
            for k = 1 : numImage
                otherTest(1,k)=sqrt((testImage'-S(k,EigenRange)')'*(testImage'-S(k,EigenRange)'));
            end
            [minTest,minTestPosition] = min(otherTest,[],2)
            Emotion = cell2mat(imageLabel{1,2}(minTestPosition))           
            time    = clock;
            day  = sprintf('%d-%d-%d',time(3),time(2),time(1));
            hour = sprintf('%d:%d:%d',time(4),time(5),round(time(6)));       
            load('duLieu.mat');
            data{bienDem,1} = day;
            data{bienDem,2} = hour;
            data{bienDem,3} = Emotion;
            save('duLieu.mat','data');
            goiLED(Emotion);
            load('duLieu.mat');
            bienDem = bienDem + 1;
            save('bienDem.mat','bienDem');
            set(handles.uitable1,'Data',data); 
            %nhan dien xong cam xuc
            end
        elseif j==1
            if imageMouthDetect(1,2)>x/2
                if imageMouthDetect(1,2)< 0.65*x
                    rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(1,1),imageFaceDetect(i,2)+imageMouthDetect(1,2)-15+x/15,imageMouthDetect(1,3),imageMouthDetect(1,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');
                    I = imcrop(J,[imageMouthDetect(1,1),imageMouthDetect(1,2)-15+x/15,imageMouthDetect(1,3),imageMouthDetect(1,4)]);
                    figure(4),imshow(I);
                else
                    rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(1,1),imageFaceDetect(i,2)+imageMouthDetect(1,2)-15,imageMouthDetect(1,3),imageMouthDetect(1,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');
                    I = imcrop(J,[imageMouthDetect(1,1),imageMouthDetect(1,2)-15,imageMouthDetect(1,3),imageMouthDetect(1,4)]);
                    figure(4), imshow(I);
                end
            %nhan dang cam xuc
            image          = zeros(imageSize(1) * imageSize(2),1);
            imageResize    = imresize(I,imageSize);%cat anh lay khuon mieng
            imageDimension = size(imageResize,3);
            if(imageDimension == 1)
                imageTemp = imageResize;
            else
                imageTemp = rgb2gray(imageResize);
            end
            finalImage    = histeq(uint8(imageTemp));
            image(:,1)    = finalImage(:);% luu hinh test dang cot
            image         = (image-meanImage*ones(1,1))';
            projectedTest = image*C;
            EigenRange    = 1:(soMau-1);
            testImage     = projectedTest(1,:);
            otherTest     = zeros(1,numImage);
            for k = 1 : numImage
                otherTest(1,k)=sqrt((testImage'-S(k,EigenRange)')'*(testImage'-S(k,EigenRange)'));
            end
            [minTest,minTestPosition] = min(otherTest,[],2)
            Emotion = cell2mat(imageLabel{1,2}(minTestPosition))
            time    = clock;
            day  = sprintf('%d-%d-%d',time(3),time(2),time(1));
            hour = sprintf('%d:%d:%d',time(4),time(5),round(time(6)));       
            load('duLieu.mat');
            data{bienDem,1} = day;
            data{bienDem,2} = hour;
            data{bienDem,3} = Emotion;
            save('duLieu.mat','data');
            goiLED(Emotion);
            load('duLieu.mat');
            bienDem = bienDem + 1;
            save('bienDem.mat','bienDem');
            set(handles.uitable1,'Data',data); 
            end
        end
    end
end
bienDem_1 = bienDem_1 + 1;
save('bienDem_1.mat','bienDem_1');
if(bienDem < bienDem_1)
      Emotion = 'NULL';
      time    = clock;
      day  = sprintf('%d-%d-%d',time(3),time(2),time(1));
      hour = sprintf('%d:%d:%d',time(4),time(5),round(time(6)));       
      load('duLieu.mat');
      data{bienDem,1} = day;
      data{bienDem,2} = hour;
      data{bienDem,3} = Emotion;
      save('duLieu.mat','data');
       goiLED(Emotion);
      load('duLieu.mat');
      bienDem = bienDem + 1;
      save('bienDem.mat','bienDem');
      set(handles.uitable1,'Data',data); 
end
% --- Executes during object creation, after setting all properties.
function ketQua_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ketQua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in xuatFile.
function xuatFile_Callback(hObject, eventdata, handles)
% hObject    handle to xuatFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% load('duLieu.mat');

valueTest=0;
load('duLieu.mat');
for i = 1 :length(data)
    if data{i,1} == ' '
        valueTest=valueTest + 1;
    end
end
if valueTest == length(data)
     f = msgbox('            Khong Co Data !');
else
    winopen('data.xls');
end


% --- Executes during object creation, after setting all properties.
function xuatFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xuatFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in huongDan.
function huongDan_Callback(hObject, eventdata, handles)
% hObject    handle to huongDan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = msgbox({
    '      0. Mo Camera: Mo Chuc Nang Camera         ';
    '      1. Auto: Mo Chuc Nang Tu Dong CHup Va Nhan Dien      ';
    '      2. Chup Anh: Chup Anh Can Nhan Dien       ';
    '      3. Them Anh: Chon Anh Tu May Tinh         ';
    '      4. Luu Data: Luu Du Lieu Da Nhan Dang     ';
    '      5. Xuat File: Xuat Ra File .xls           ';
    '      6. Ket Qua: Dua Ra Cam Xuc Da Nhan Dang   ';
    '      7. Axes1: Hien Thi Camera                 ';
    '      8. Axes1: Hien Thi Anh Chup Tu Camera     ';
    '      9. Table1: Hien Thi Toan Bo Data Da Nhan Dang  ';
    },'Huong Dan');


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in autochup.
function autochup_Callback(hObject, eventdata, handles)
% hObject    handle to autochup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CAMON = handles.CAMON;
load('MODE.mat');
MODE = 1;
save('MODE.mat','MODE');
load('MODE.mat');
CAMON
MODE
if CAMON == 1
load('demAnh.mat');    
        while(1) 
            load('MODE.mat');
            if MODE == 1
            vid = handles.vid;
            axes(handles.axes2);
            videoFrame = getsnapshot(vid);
            imshow(videoFrame);
            pathName = 'C:\Users\Admin\Desktop\KLTN\KLTN2021\TestAnh\';
            fileName = [pathName num2str(demAnh) '.jpg'];
            imwrite(videoFrame,fileName);
            demAnh = demAnh + 1;
            save('demAnh.mat','demAnh');
            load('bienDem.mat');
            load('bienDem_1.mat');
            a=load('C.mat');
            b=load('S.mat');
            c=load('L.mat');
            d=load('imageLabel.mat');
            e=load('meanImage.mat');
            f=load('soMau.mat');
            C=a.C;
            S=b.S;
            L=c.L;
            soMau      = f.soMau;
            meanImage  = e.meanImage;
            imageLabel = d.imageLabel;
            imageSize  = [60,60];
            numImage   = size(S,1);
            FaceDetect      = vision.CascadeObjectDetector;
            imageFaceDetect = step(FaceDetect,videoFrame);
            for  i = 1:size(imageFaceDetect,1)
                sizeImageFaceDetect = imageFaceDetect(i,3)*imageFaceDetect(i,4)
                %vung chua khuon mat
                if sizeImageFaceDetect > 7200
                    i1    = size(imageFaceDetect,1)
                    a     = rectangle('Position',imageFaceDetect(i1,:),'LineWidth',3,'LineStyle','-','EdgeColor','r');
                    J     = imcrop(videoFrame,[imageFaceDetect(i1,1),imageFaceDetect(i1,2),imageFaceDetect(i1,3),imageFaceDetect(i1,4)+15]);
                    [x y] = size(J(:,:,1));
                    MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
                    imageMouthDetect = step(MouthDetect,J);
                    %tim vung chua mouth
                    j = size(imageMouthDetect,1);
                    if(j>1)
                        maxValue = max(imageMouthDetect(:,2));
                        [ik jk]  = find(imageMouthDetect(:,2) == maxValue);
                        if imageMouthDetect(ik,2)>x/2
                            if imageMouthDetect(ik,2)<0.65*x
                                rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(ik,1),imageFaceDetect(i,2)+imageMouthDetect(ik,2)-15+x/15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');
                                I = imcrop(J,[imageMouthDetect(ik,1),imageMouthDetect(ik,2)-15+x/15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)]);
                                figure(4), imshow(I);
                            else
                                rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(ik,1),imageFaceDetect(i,2)+imageMouthDetect(ik,2)-15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');                    
                                I = imcrop(J,[imageMouthDetect(ik,1),imageMouthDetect(ik,2)-15,imageMouthDetect(ik,3),imageMouthDetect(ik,4)]);
                                figure(4), imshow(I);
                        end
                    	%nhan dien cam xuc
                        image          = zeros(imageSize(1) * imageSize(2),1);
                        imageResize    = imresize(I,imageSize);%cat anh lay khuon mieng
                        imageDimension = size(imageResize,3);
                        if(imageDimension == 1)
                            imageTemp = imageResize;
                        else
                            imageTemp = rgb2gray(imageResize);
                        end
                        finalImage    = histeq(uint8(imageTemp));
                        image(:,1)    = finalImage(:);% luu hinh test dang cot
                        image         = (image-meanImage*ones(1,1))';
                        projectedTest = image*C;
                        EigenRange    = 1:(soMau-1);
                        testImage     = projectedTest(1,:);
                        otherTest     = zeros(1,numImage);
                        for k = 1 : numImage
                            otherTest(1,k)=sqrt((testImage'-S(k,EigenRange)')'*(testImage'-S(k,EigenRange)'));
                        end
                        [minTest,minTestPosition] = min(otherTest,[],2)
                        Emotion = cell2mat(imageLabel{1,2}(minTestPosition))
                        time    = clock;
                        day  = sprintf('%d-%d-%d',time(3),time(2),time(1));
                        hour = sprintf('%d:%d:%d',time(4),time(5),round(time(6)));       
                        load('duLieu.mat');
                        data{bienDem,1} = day;
                        data{bienDem,2} = hour;
                        data{bienDem,3} = Emotion;
                        save('duLieu.mat','data');
                        load('duLieu.mat');
                        % goi ham dieu khien led
                        goiLED(Emotion);
                        bienDem = bienDem + 1;
                        save('bienDem.mat','bienDem');
                        set(handles.uitable1,'Data',data); 
                        %nhan dien xong cam xuc
                        end
                    elseif j==1
                        if imageMouthDetect(1,2)>x/2
                            if imageMouthDetect(1,2)< 0.65*x
                                rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(1,1),imageFaceDetect(i,2)+imageMouthDetect(1,2)-15+x/15,imageMouthDetect(1,3),imageMouthDetect(1,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');
                                I = imcrop(J,[imageMouthDetect(1,1),imageMouthDetect(1,2)-15+x/15,imageMouthDetect(1,3),imageMouthDetect(1,4)]);
                                figure(4),imshow(I);
                            else
                            rectangle('Position',[imageFaceDetect(i,1)+imageMouthDetect(1,1),imageFaceDetect(i,2)+imageMouthDetect(1,2)-15,imageMouthDetect(1,3),imageMouthDetect(1,4)],'LineWidth',4,'LineStyle','-','EdgeColor','b');
                            I = imcrop(J,[imageMouthDetect(1,1),imageMouthDetect(1,2)-15,imageMouthDetect(1,3),imageMouthDetect(1,4)]);
                            figure(4), imshow(I);
                        end
                        %nhan dang cam xuc
                        image          = zeros(imageSize(1) * imageSize(2),1);
                        imageResize    = imresize(I,imageSize);%cat anh lay khuon mieng
                        imageDimension = size(imageResize,3);
                        if(imageDimension == 1)
                            imageTemp = imageResize;
                        else
                        imageTemp = rgb2gray(imageResize);
                    end
                    finalImage    = histeq(uint8(imageTemp));
                    image(:,1)    = finalImage(:);% luu hinh test dang cot
                    image         = (image-meanImage*ones(1,1))';
                    projectedTest = image*C;
                    EigenRange    = 1:(soMau-1);
                    testImage     = projectedTest(1,:);
                    otherTest     = zeros(1,numImage);
                    for k = 1 : numImage
                        otherTest(1,k)=sqrt((testImage'-S(k,EigenRange)')'*(testImage'-S(k,EigenRange)'));
                    end
                    [minTest,minTestPosition] = min(otherTest,[],2)
                    Emotion = cell2mat(imageLabel{1,2}(minTestPosition))
                    time    = clock;
                    day  = sprintf('%d-%d-%d',time(3),time(2),time(1));
                    hour = sprintf('%d:%d:%d',time(4),time(5),round(time(6)));       
                    load('duLieu.mat');
                    data{bienDem,1} = day;
                    data{bienDem,2} = hour;
                    data{bienDem,3} = Emotion;
                    save('duLieu.mat','data');
                    % goi ham dieu khien led
                    goiLED(Emotion);
                    load('duLieu.mat');
                    bienDem = bienDem + 1;
                    save('bienDem.mat','bienDem');
                    set(handles.uitable1,'Data',data); 
                        end
                    end
                end
            end
        bienDem_1 = bienDem_1 + 1;
        save('bienDem_1.mat','bienDem_1');
        if(bienDem < bienDem_1)
            Emotion = 'NULL';
            time    = clock;
            day  = sprintf('%d-%d-%d',time(3),time(2),time(1));
            hour = sprintf('%d:%d:%d',time(4),time(5),round(time(6)));       
            load('duLieu.mat');
            data{bienDem,1} = day;
            data{bienDem,2} = hour;
            data{bienDem,3} = Emotion;
            save('duLieu.mat','data');
            load('duLieu.mat');
            bienDem = bienDem + 1;
            save('bienDem.mat','bienDem');
            set(handles.uitable1,'Data',data); 
        end
        pause(3);
            else
                break
        end 
    end
else
     f = msgbox('        Hay Mo Camera Cua Ban !!! ');
end
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function autochup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to autochup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pushbutton15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in trangthai.
function trangthai_Callback(hObject, eventdata, handles)
% hObject    handle to trangthai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fid = fopen('TrangThai.dat','r')';
noidung = fread(fid,100,'uint8=>char')'
f=msgbox(noidung)

% --- Executes during object creation, after setting all properties.
function trangthai_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trangthai (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
