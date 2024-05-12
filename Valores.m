function varargout = Valores(varargin)
% VALORES MATLAB code for Valores.fig
%      VALORES, by itself, creates a new VALORES or raises the existing
%      singleton*.
%
%      H = VALORES returns the handle to a new VALORES or the handle to
%      the existing singleton*.
%
%      VALORES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VALORES.M with the given input arguments.
%
%      VALORES('Property','Value',...) creates a new VALORES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Valores_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Valores_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Valores

% Last Modified by GUIDE v2.5 19-Jan-2018 01:01:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Valores_OpeningFcn, ...
                   'gui_OutputFcn',  @Valores_OutputFcn, ...
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


% --- Executes just before Valores is made visible.
function Valores_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Valores (see VARARGIN)

% Choose default command line output for Valores
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global X Y Z plum_rise_model reflection deposition Q u_ref h h_ref stability terrain p mw...
    amb_temp stack_temp stack_diameter specific_heat amb_pres stack_pres...
    stack_velocity term_velocity
set(handles.text44,'String',Q)
set(handles.text45,'String',u_ref)
set(handles.text46,'String',h_ref)
set(handles.text47,'String',terrain)
set(handles.text48,'String',stability)
set(handles.text49,'String',p)
set(handles.text50,'String',amb_pres)
set(handles.text51,'String',amb_temp)
set(handles.text52,'String',X(end))
set(handles.text53,'String',Y(end))
set(handles.text54,'String',Z(end))
set(handles.text55,'String',h)
set(handles.text56,'String',stack_temp)
set(handles.text57,'String',stack_diameter)
set(handles.text58,'String',stack_pres)
set(handles.text59,'String',stack_velocity)
set(handles.text60,'String',mw)
set(handles.text61,'String',specific_heat)
set(handles.text62,'String',term_velocity)
set(handles.text63,'String',plum_rise_model)
set(handles.text64,'String',reflection)
set(handles.text65,'String',deposition)


% UIWAIT makes Valores wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Valores_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
