function varargout = GUI_FootPressure(varargin)
% GUI_FOOTPRESSURE MATLAB code for GUI_FootPressure.fig
%      GUI_FOOTPRESSURE, by itself, creates a new GUI_FOOTPRESSURE or raises the existing
%      singleton*.
%
%      H = GUI_FOOTPRESSURE returns the handle to a new GUI_FOOTPRESSURE or the handle to
%      the existing singleton*.
%
%      GUI_FOOTPRESSURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FOOTPRESSURE.M with the given input arguments.
%
%      GUI_FOOTPRESSURE('Property','Value',...) creates a new GUI_FOOTPRESSURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_FootPressure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_FootPressure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_FootPressure

% Last Modified by GUIDE v2.5 04-Jan-2022 23:32:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_FootPressure_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_FootPressure_OutputFcn, ...
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


% --- Executes just before GUI_FootPressure is made visible.
function GUI_FootPressure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_FootPressure (see VARARGIN)

% Choose default command line output for GUI_FootPressure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_FootPressure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_FootPressure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pilihfile.
function pilihfile_Callback(hObject, eventdata, handles)
% hObject    handle to pilihfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
clc;
global berkas;
[baseFileName, folder] = uigetfile({'*.csv;*.mat;*.txt;'});
berkas = fullfile(folder, baseFileName);
berkas = load(berkas);


% --- Executes on button press in proyeksi.
function proyeksi_Callback(hObject, eventdata, handles)
% hObject    handle to proyeksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global berkas;
% tambah = csvread('kaki 1.csv');
% berkas = berkas + tambah;
figure;
imagesc(berkas);
colormap jet;
% saveas(gcf,'Hanif_Menit0.png');




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global berkas;
figure;
image = imresize(berkas, 2.5, 'bicubic');
colormap jet;
imagesc(image);
% saveas(gcf,'Hanif_Menit0_bicubic.png');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveas(Figure1,'KakiKanan.png');


% --- Executes on button press in Contour.
function Contour_Callback(hObject, eventdata, handles)
% hObject    handle to Contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global berkas;
figure;
contour(berkas, 'ShowText','on');
% saveas(gcf,'Pixel_contour.png');



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveas(Figure2,'KakiKanan_bikubik.png');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
saveas(Figure3,'Pixel_contour.png');
