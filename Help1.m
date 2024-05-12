function varargout = Help1(varargin)
% HELP1 MATLAB code for Help1.fig
%      HELP1, by itself, creates a new HELP1 or raises the existing
%      singleton*.
%
%      H = HELP1 returns the handle to a new HELP1 or the handle to
%      the existing singleton*.
%
%      HELP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP1.M with the given input arguments.
%
%      HELP1('Property','Value',...) creates a new HELP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Help1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Help1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Help1

% Last Modified by GUIDE v2.5 18-Jan-2018 04:05:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Help1_OpeningFcn, ...
                   'gui_OutputFcn',  @Help1_OutputFcn, ...
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


% --- Executes just before Help1 is made visible.
function Help1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Help1 (see VARARGIN)

% Choose default command line output for Help1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1)
imshow('Glifford.PNG')

% UIWAIT makes Help1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Help1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;