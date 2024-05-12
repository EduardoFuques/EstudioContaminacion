function varargout = Importar(varargin)
% IMPORTAR MATLAB code for Importar.fig
%      IMPORTAR, by itself, creates a new IMPORTAR or raises the existing
%      singleton*.
%
%      H = IMPORTAR returns the handle to a new IMPORTAR or the handle to
%      the existing singleton*.
%
%      IMPORTAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPORTAR.M with the given input arguments.
%
%      IMPORTAR('Property','Value',...) creates a new IMPORTAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Importar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Importar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Importar

% Last Modified by GUIDE v2.5 20-Jan-2018 00:14:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Importar_OpeningFcn, ...
                   'gui_OutputFcn',  @Importar_OutputFcn, ...
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


% --- Executes just before Importar is made visible.
function Importar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Importar (see VARARGIN)

% Choose default command line output for Importar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Importar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Importar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global plum_rise_model reflection deposition Q u_ref h h_ref stability terrain p mw...
    amb_temp stack_temp stack_diameter specific_heat amb_pres stack_pres...
    stack_velocity term_velocity Xf Yf Zf pasos
nombre=get(handles.edit1,'String');
num=get(handles.edit2,'String');
[A,B]=xlsread(nombre,num,'C5:C27');
Q=A(1);
u_ref=A(2);
h_ref=A(3);
terrain=char(B(1));
Y=char(B(2));
switch Y
    case {'Promedio'}
        stability='F';
    otherwise        
        stability=char(B(2));
end
p=A(6);
amb_pres=A(7);
amb_temp=A(8);
Xf=A(9);
Yf=A(10);
Zf=A(11);
h=A(12);
stack_temp=A(13);
stack_diameter=A(14);
stack_pres=A(15);
stack_velocity=A(16);
mw=A(17);
specific_heat=A(18);
term_velocity=A(19);
plum_rise_model=char(B(17));
reflection=char(B(18));
deposition=char(B(19));
pasos=A(23);
mensaje=msgbox('Operación Completada');
uiwait(mensaje)
Base;
close(distribucion_gaussiana);
close(Importar);


            
        
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
