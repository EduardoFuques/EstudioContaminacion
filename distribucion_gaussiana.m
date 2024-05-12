function varargout = distribucion_gaussiana(varargin)
% DISTRIBUCION_GAUSSIANA MATLAB code for distribucion_gaussiana.fig
%      DISTRIBUCION_GAUSSIANA, by itself, creates a new DISTRIBUCION_GAUSSIANA or raises the existing
%      singleton*.
%
%      H = DISTRIBUCION_GAUSSIANA returns the handle to a new DISTRIBUCION_GAUSSIANA or the handle to
%      the existing singleton*.
%
%      DISTRIBUCION_GAUSSIANA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISTRIBUCION_GAUSSIANA.M with the given input arguments.
%
%      DISTRIBUCION_GAUSSIANA('Property','Value',...) creates a new DISTRIBUCION_GAUSSIANA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before distribucion_gaussiana_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to distribucion_gaussiana_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help distribucion_gaussiana

% Last Modified by GUIDE v2.5 20-Jan-2018 00:56:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @distribucion_gaussiana_OpeningFcn, ...
                   'gui_OutputFcn',  @distribucion_gaussiana_OutputFcn, ...
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


% --- Executes just before distribucion_gaussiana is made visible.
function distribucion_gaussiana_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to distribucion_gaussiana (see VARARGIN)

% Choose default command line output for distribucion_gaussiana
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
I=imread('portada.PNG');
axes(handles.axes2);
imshow(I)

% UIWAIT makes distribucion_gaussiana wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = distribucion_gaussiana_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
clear all
global Xf Yf Zf plum_rise_model reflection deposition Q u_ref h h_ref stability terrain p mw...
    amb_temp stack_temp stack_diameter specific_heat amb_pres stack_pres...
    stack_velocity term_velocity pasos
Xf=25000;
Yf=2000;
Zf=1000;
plum_rise_model='none';
reflection='none';
deposition='none';
Q=200;
u_ref=5.7;
h=0.4;
h_ref=2;
stability='F';
terrain='urban';
p=0.4;
mw=30;
amb_temp=21;
stack_temp=120;
stack_diameter=0.06;
stack_velocity=1;
specific_heat=1020;
amb_pres=991.1;
stack_pres=995;
term_velocity=0.005;
pasos=20;
Base;
close(distribucion_gaussiana);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
Simular;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
Importar;
