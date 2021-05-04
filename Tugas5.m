function varargout = Tugas5(varargin)
% TUGAS5 MATLAB code for Tugas5.fig
%      TUGAS5, by itself, creates a new TUGAS5 or raises the existing
%      singleton*.
%
%      H = TUGAS5 returns the handle to a new TUGAS5 or the handle to
%      the existing singleton*.
%
%      TUGAS5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS5.M with the given input arguments.
%
%      TUGAS5('Property','Value',...) creates a new TUGAS5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tugas5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tugas5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tugas5

% Last Modified by GUIDE v2.5 04-May-2021 17:33:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tugas5_OpeningFcn, ...
                   'gui_OutputFcn',  @Tugas5_OutputFcn, ...
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


% --- Executes just before Tugas5 is made visible.
function Tugas5_OpeningFcn(hObject, ~, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = Tugas5_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg*'; '*.png*'; '*.jpeg*'});
if ~isequal(filename,0)
    gambar = imread(fullfile(pathname,filename));
    [~,~,m] = size(gambar);
    if m == 3
        axes(handles.axes1)
        imshow(gambar)
        handles.gambar = gambar;
        title('Citra RGB')
        guidata(hObject, handles)
    else
        msgbox('harap pilih citra RGB')
    end
else
    return
end

set(handles.radiobutton1,'Enable','on')
set(handles.radiobutton2,'Enable','on')
set(handles.radiobutton3,'Enable','on')
set(handles.radiobutton4,'Enable','on')

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(~, ~, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',1)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)

% Menampilkan gambar RGB
gambar = handles.gambar;
axes(handles.axes1)
imshow(gambar)
title('Citra RGB')
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

% Tampilkan Histogram RGB
axes(handles.axes2)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255]) 
h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
hold off
title('Histogram')

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(~, ~, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',1)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)

gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

% Untuk merubah gambar RGB menjadi layer Red
Red_Layer = cat(3,R,G*0,B*0);
axes(handles.axes1)
cla('reset')
imshow(Red_Layer)
title('Red Layer')
% Menampilkan Histogram layer Red
axes(handles.axes2)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
title('Histogram')

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',1)
set(handles.radiobutton4,'Value',0)

gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);
% Untuk merubah gambar RGB menjadi layer Green
Green_Layer = cat(3,R*0,G,B*0);
axes(handles.axes1)
cla('reset')
imshow(Green_Layer)
title('Green Layer')
% Menampilkan Histogram layer Green
axes(handles.axes2)
cla('reset')
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255])
grid on
title('Histogram')

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',1)

gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);
% Untuk merubah gambar RGB menjadi layer Blue
Blue_Layer = cat(3,R*0,G*0,B);
axes(handles.axes1)
cla('reset')
imshow(Blue_Layer)
title('Blue Layer')
% Menampilkan Histogram layer Blue
axes(handles.axes2)
cla('reset')
h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
grid on
title('Histogram')

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(~, ~, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);


axes(handles.axes1)
imshow(gambar)
title('Citra RGB')

axes(handles.axes2)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255]) 
h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
hold off
title('Histogram')

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(~, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

% Untuk merubah gambar RGB menjadi layer Green
GreenOnly = cat(3,R*0,G,B*0);
axes(handles.axes1)
cla('reset')
imshow(GreenOnly)
title('Green Only')

axes(handles.axes2)
cla('reset')
imhist(G);
title('\color{green}Green Only')

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;

axes(handles.axes1)
cla ('reset')
abu2 = rgb2gray(gambar);
imshow(abu2)
title('Citra Grayscale')

axes(handles.axes2)
cla('reset')
imhist(abu2);
title('Grayscale')

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

% Untuk merubah gambar RGB menjadi layer Blue
BlueOnly = cat(3,R*0,G*0,B);
axes(handles.axes1)
cla('reset')
imshow(BlueOnly)
title('Blue Only')

axes(handles.axes2)
cla('reset')
imhist(B);
title('\color{blue}Blue Only')

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;

axes(handles.axes1)
bw = im2bw(gambar,0.5);
imshow(bw)
title('Citra B/W')

axes(handles.axes2)
cla('reset')
h = histogram(double(bw(:)),2);
h.FaceColor = [0 0 0];
h.EdgeColor = [0 0 0];
set(gca,'Xlim',[0 1])
grid on
title('B/W')

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;

% Untuk merubah gambar RGB menjadi Negatif
Negatif = imcomplement(gambar);
axes(handles.axes1)
cla('reset')
imshow(Negatif)
title('Citra Negatif')

% Menampilkan histogram original
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);
 
axes(handles.axes2)
cla('reset')
h = histogram(R(:),256);
h.FaceColor = [1 0 0];
h.EdgeColor = 'r';
hold on
title('Original')
 
h = histogram(G(:),256);
h.FaceColor = [0 1 0];
h.EdgeColor = 'g';
 
h = histogram(B(:),256);
h.FaceColor = [0 0 1];
h.EdgeColor = 'b';
set(gca,'Xlim',[0 255])
grid on
hold off

% Menampilkan histogram negatif
R = Negatif(:,:,1);
G = Negatif(:,:,2);
B = Negatif(:,:,3);

axes(handles.axes2)
cla('reset')
h = histogram(R(:),256);
h.FaceColor = [1 0 0];
h.EdgeColor = 'r';
hold on
title('Negatif')
 
h = histogram(G(:),256);
h.FaceColor = [0 1 0];
h.EdgeColor = 'g';
 
h = histogram(B(:),256);
h.FaceColor = [0 0 1];
h.EdgeColor = 'b';
set(gca,'Xlim',[0 255])
grid on
hold off

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = handles.gambar;
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

% Untuk merubah gambar RGB menjadi layer Red
RedOnly = cat(3,R,G*0,B*0);
axes(handles.axes1)
cla('reset')
imshow(RedOnly)
title('Red Only')

axes(handles.axes2)
cla('reset')
imhist(R);
title('\color{red}Red Only')

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S = getframe(handles.axes1);
Simpan = frame2im(S);
imwrite(Simpan, 'Image.jpg')


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes2);
imhist(input);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Thanks for using my image processing tool by DAMELIA');
pause(1);
close();
close();
