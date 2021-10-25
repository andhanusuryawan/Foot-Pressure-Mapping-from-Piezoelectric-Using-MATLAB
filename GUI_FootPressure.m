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

% Last Modified by GUIDE v2.5 02-Jul-2021 21:01:08

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
cla(handles.axes1,'reset');
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
imagesc(berkas);
colormap jet;




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global berkas;
image = imresize(berkas, 2.5, 'bicubic');
imagesc(image);
