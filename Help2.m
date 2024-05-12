function varargout = Help2(varargin)
% HELP2 MATLAB code for Help2.fig
%      HELP2, by itself, creates a new HELP2 or raises the existing
%      singleton*.
%
%      H = HELP2 returns the handle to a new HELP2 or the handle to
%      the existing singleton*.
%
%      HELP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP2.M with the given input arguments.
%
%      HELP2('Property','Value',...) creates a new HELP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help2

% Last Modified by GUIDE v2.5 18-Jan-2018 04:22:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help2_OpeningFcn, ...
                   'gui_OutputFcn',  @Help2_OutputFcn, ...
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


% --- Executes just before Help2 is made visible.
function Help2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help2 (see VARARGIN)

% Choose default command line output for Help2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1)
imshow('PerfilViento.PNG');

% UIWAIT makes Help2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
