function varargout = Simular(varargin)
% SIMULAR MATLAB code for Simular.fig
%      SIMULAR, by itself, creates a new SIMULAR or raises the existing
%      singleton*.
%
%      H = SIMULAR returns the handle to a new SIMULAR or the handle to
%      the existing singleton*.
%
%      SIMULAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULAR.M with the given input arguments.
%
%      SIMULAR('Property','Value',...) creates a new SIMULAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Simular_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Simular_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Simular

% Last Modified by GUIDE v2.5 23-Jan-2018 17:56:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Simular_OpeningFcn, ...
                   'gui_OutputFcn',  @Simular_OutputFcn, ...
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


% --- Executes just before Simular is made visible.
function Simular_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Simular (see VARARGIN)

% Choose default command line output for Simular
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.Dias,'Enable','off')
set(handles.Dias,'String','Seleccione Mes')
set(handles.Meses,'Value',13)
set(handles.pushbutton1,'Enable','off')

% UIWAIT makes Simular wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Simular_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Meses.
function Meses_Callback(hObject, eventdata, handles)
dia29=char({'01';'02';'03';'04';'05';'06';'07';'08';'09';'10';'11';'12';...
    '13';'14';'15';'16';'17';'18';'19';'20';'21';'22';'23';'24';'25';...
    '26';'27';'28';'29'});
dia30=char({'01';'02';'03';'04';'05';'06';'07';'08';'09';'10';'11';'12';...
    '13';'14';'15';'16';'17';'18';'19';'20';'21';'22';'23';'24';'25';...
    '26';'27';'28';'29';'30'});
dia31=char({'01';'02';'03';'04';'05';'06';'07';'08';'09';'10';'11';'12';...
    '13';'14';'15';'16';'17';'18';'19';'20';'21';'22';'23';'24';'25';...
    '26';'27';'28';'29';'30';'31'});
mes=get(hObject,'Value');
set(handles.Dias,'Enable','on');
switch mes
    case {1}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {2}
        dia=dia29;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {3}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {4}
        dia=dia30;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {5}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {6}
        dia=dia30;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {7}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {8}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {9}
        dia=dia30;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {10}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {11}
        dia=dia30;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {12}
        dia=dia31;
        set(handles.Dias,'String',dia)
        set(handles.pushbutton1,'Enable','on')
        set(handles.Dias,'Value',1)
    case {13}
        set(handles.Dias,'String','Seleccione Mes')
        set(handles.Dias,'Enable','off'); 
        set(handles.pushbutton1,'Enable','off')   
        
end

% hObject    handle to Meses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Meses contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Meses


% --- Executes during object creation, after setting all properties.
function Meses_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Meses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Dias.
function Dias_Callback(hObject, eventdata, handles)
% hObject    handle to Dias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Dias contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Dias


% --- Executes during object creation, after setting all properties.
function Dias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global Xf Yf Zf plum_rise_model reflection deposition Q u_ref h h_ref p mw...
    amb_temp stack_temp stack_diameter specific_heat amb_pres stack_pres...
    stack_velocity term_velocity pasos st1 st2 st3 st4 st5 st6 PerIns mes dia Ndia
load('Meteorología.mat')
mes=get(handles.Meses,'Value');
dia=get(handles.Dias,'Value');
Ndia=datenum(2016,mes,dia)-datenum(2015,12,31);
PerIns=Insolacion(:,Ndia);
Xf=25000;
Yf=2000;
Zf=1000;
plum_rise_model='none';
reflection='none';
deposition='none';
Q=str2double(get(handles.edit1,'String'));
u_ref=Viento(Ndia);
amb_temp=Temperaturas(Ndia);
h=0.4;
h_ref=2;
p=0.4;
mw=30;
stack_temp=120;
stack_diameter=0.06;
stack_velocity=1;
specific_heat=1020;
amb_pres=Presion(mes);
stack_pres=1000;
term_velocity=0.005;
pasos=20;
if and(u_ref>=0,u_ref<=0.77)
    st1='A';    %Insolación Fuerte
    st2='A';    %Insolación Moderada
    st3='B';    %Insolación Ligera
    st4='C';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='F';    %Noche
elseif and(u_ref>0.77,u_ref<=1.8)
    st1='A';    %Insolación Fuerte
    st2='B';    %Insolación Moderada
    st3='B';    %Insolación Ligera
    st4='C';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='F';    %Noche
elseif and(u_ref>1.8,u_ref<=2.83)
    st1='A';    %Insolación Fuerte
    st2='B';    %Insolación Moderada
    st3='C';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='F';    %Noche
elseif and(u_ref>2.83,u_ref<=3.34)
    st1='B';    %Insolación Fuerte
    st2='B';    %Insolación Moderada
    st3='C';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='F';    %Noche
elseif and(u_ref>3.34,u_ref<=3.86) 
    st1='B';    %Insolación Fuerte
    st2='B';    %Insolación Moderada
    st3='C';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='E';    %Noche
elseif and(u_ref>3.86,u_ref<=4.89)
    st1='B';    %Insolación Fuerte
    st2='C';    %Insolación Moderada
    st3='C';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='E';    %Noche
elseif and(u_ref>4.89,u_ref<=5.4)
    st1='C';    %Insolación Fuerte
    st2='C';    %Insolación Moderada
    st3='D';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='E';    %Noche
elseif and(u_ref>5.4,u_ref<5.92)
    st1='C';    %Insolación Fuerte
    st2='C';    %Insolación Moderada
    st3='D';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='D';    %Noche
elseif u_ref>=5.92
    st1='C';    %Insolación Fuerte
    st2='D';    %Insolación Moderada
    st3='D';    %Insolación Ligera
    st4='D';    %Insolación Debil
    st5='D';    %Nubosidad
    st6='D';    %Noche
end

SimModelo;
close(distribucion_gaussiana);
close(Simular);


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
