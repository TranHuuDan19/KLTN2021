function varargout = demovuithoi(varargin)
% DEMOVUITHOI MATLAB code for demovuithoi.fig
%      DEMOVUITHOI, by itself, creates a new DEMOVUITHOI or raises the existing
%      singleton*.
%
%      H = DEMOVUITHOI returns the handle to a new DEMOVUITHOI or the handle to
%      the existing singleton*.
%
%      DEMOVUITHOI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMOVUITHOI.M with the given input arguments.
%
%      DEMOVUITHOI('Property','Value',...) creates a new DEMOVUITHOI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demovuithoi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demovuithoi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demovuithoi

% Last Modified by GUIDE v2.5 17-May-2021 14:40:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demovuithoi_OpeningFcn, ...
                   'gui_OutputFcn',  @demovuithoi_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before demovuithoi is made visible.
function demovuithoi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demovuithoi (see VARARGIN)

% Choose default command line output for demovuithoi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demovuithoi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demovuithoi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a=arduino('COM9','Uno');
    status_led1 = str2double(get(handles.edit1,'String'))
    status_led=status_led1;
    save('status_led.mat','status_led');  
    load('status_led.mat');
while(1)
    status_led_backup = str2double(get(handles.edit1,'String'))
if (status_led ==  1 )
    writeDigitalPin(a,'D2',1);
    writeDigitalPin(a,'D3',0);
    writeDigitalPin(a,'D4',0);
end
if (status_led ==  2 )
   
    writeDigitalPin(a,'D2',0);
    writeDigitalPin(a,'D3',1);
    writeDigitalPin(a,'D4',0);
end
    if (status_led ==  3  )
 
    writeDigitalPin(a,'D2',0);
    writeDigitalPin(a,'D3',0);
    writeDigitalPin(a,'D4',1);

end
end
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


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.

