function varargout = Exportar(varargin)
% EXPORTAR MATLAB code for Exportar.fig
%      EXPORTAR, by itself, creates a new EXPORTAR or raises the existing
%      singleton*.
%
%      H = EXPORTAR returns the handle to a new EXPORTAR or the handle to
%      the existing singleton*.
%
%      EXPORTAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPORTAR.M with the given input arguments.
%
%      EXPORTAR('Property','Value',...) creates a new EXPORTAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Exportar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Exportar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Exportar

% Last Modified by GUIDE v2.5 19-Jan-2018 05:16:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Exportar_OpeningFcn, ...
                   'gui_OutputFcn',  @Exportar_OutputFcn, ...
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


% --- Executes just before Exportar is made visible.
function Exportar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Exportar (see VARARGIN)

% Choose default command line output for Exportar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Exportar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Exportar_OutputFcn(hObject, eventdata, handles) 
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
global Cb corrector Z slide Y X plum_rise_model reflection deposition Q u_ref h h_ref stability p mw...
    amb_temp stack_temp stack_diameter specific_heat amb_pres stack_pres...
    stack_velocity term_velocity pasos dia mes Ndia inso st1 st2 st3 st4 st5 st6
bar=waitbar(0,'Esta ventana se cerrará cuando termine la operación de exportar. Hasta entonces, no abra el excel generado.');
nombre=get(handles.edit1,'String');
num=get(handles.edit2,'String');
index=size(X,2)+24;

switch corrector
    case {1}
        fecha=[sprintf('Simulación del día N° %g correspondiente al %g/%g/2016. Grado de insolación: ',Ndia,dia,mes) inso]; 
        str1='Modelo de dispersión gaussiana de contaminantes';
        str2=sprintf('Datos X-Y para Z= %2.1f metros. Concentración en [mg/m^3]',Z(slide));
        xlswrite(nombre,cellstr(fecha),num,'B1');
        xlswrite(nombre,cellstr(str1),num,'B2');
        xlswrite(nombre,cellstr(str2),num,'B3');
        for i=1:1:size(X,2)
            coordx=X(i);
            celdax=sprintf('X%2.1f[m]',coordx);
            columna=xlcolumnletter(i+5);
            rango=[columna,num2str(5)];
            xlswrite(nombre,cellstr(celdax),num,rango);
            coordy=Y(i);
            celday=sprintf('Y%2.1f[m]',coordy);
            fila=['E',num2str(i+5)];
            xlswrite(nombre,cellstr(celday),num,fila);
            waitbar(i/index)
        end
    case {2}
        fecha=sprintf('Simulación del día N° %g correspondiente al %g/%g/2016',Ndia,dia,mes);
        str1='Modelo de dispersión gaussiana de contaminantes';
        str2=sprintf('Datos X-Z para Y= %2.1f metros. Concentración en [mg/m^3]',Y(slide));
        xlswrite(nombre,cellstr(fecha),num,'B2');
        xlswrite(nombre,cellstr(str1),num,'B2');
        xlswrite(nombre,cellstr(str2),num,'B3');
        for i=1:1:size(X,2)
            coordx=X(i);
            celdax=sprintf('X%2.1f[m]',coordx);
            columna=xlcolumnletter(i+5);
            rango=[columna,num2str(5)];
            xlswrite(nombre,cellstr(celdax),num,rango);
            coordy=Y(i);
            celday=sprintf('Z%2.1f[m]',coordy);
            fila=['E',num2str(i+5)];
            xlswrite(nombre,cellstr(celday),num,fila);
            waitbar(i/index)
        end               
end
xlswrite(nombre,Cb,num,'F6')
r=5;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Caudal de Emisión'),num,a);
xlswrite(nombre,Q,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Velocidad del viento'),num,a);
xlswrite(nombre,u_ref,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Altura de referencia'),num,a);
xlswrite(nombre,h_ref,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Tipo de suelo'),num,a);
xlswrite(nombre,cellstr('urban'),num,b);

switch inso
    case {'Fuerte'}
        stability=st1;
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    case {'Moderada'}
        stability=st2;
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    case {'Ligera'}
        stability=st3;
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    case {'Debil'}
        stability=st4;
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    case {'Nubosidad 10/10'}
        stability=st5;
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    case {'Horario Nocturno'}
        stability=st6;
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    case {'Promedio Diario'}
        stability='Promedio';
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
    otherwise
        r=r+1;
        waitbar((i+r-4)/index)
        a=['B',num2str(r)];
        b=['C',num2str(r)];
        xlswrite(nombre,cellstr('Estabilidad atmosférica'),num,a);
        xlswrite(nombre,cellstr(stability),num,b);
end

r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Exp. perfil de viento'),num,a);
xlswrite(nombre,p,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Presión ambiental'),num,a);
xlswrite(nombre,amb_pres,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Temperatura ambiental'),num,a);
xlswrite(nombre,amb_temp,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Longitud sotavento'),num,a);
xlswrite(nombre,X(end),num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Longitud perpendicular'),num,a);
xlswrite(nombre,Y(end),num,b);
r=r+1;
waitbar(i/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Longitud vertical'),num,a);
xlswrite(nombre,Z(end),num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Altura de chimenea'),num,a);
xlswrite(nombre,h,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Temperatura chimenea'),num,a);
xlswrite(nombre,stack_temp,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Diámetro chimenea'),num,a);
xlswrite(nombre,stack_diameter,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Presión chimenea'),num,a);
xlswrite(nombre,stack_pres,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Velocidad de escape'),num,a);
xlswrite(nombre,stack_velocity,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Peso molecular escape'),num,a);
xlswrite(nombre,mw,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Calor específico escape'),num,a);
xlswrite(nombre,specific_heat,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Velocidad terminal'),num,a);
xlswrite(nombre,term_velocity,num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Modelo de ascención'),num,a);
xlswrite(nombre,cellstr(plum_rise_model),num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Reflexión en suelo'),num,a);
xlswrite(nombre,cellstr(reflection),num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Deposición seca'),num,a);
xlswrite(nombre,cellstr(deposition),num,b);
r=r+1;
waitbar((i+r-4)/index)
a=['B',num2str(r)];
b=['C',num2str(r)];
xlswrite(nombre,cellstr('Pasos grafico'),num,a);
xlswrite(nombre,pasos,num,b);
close(bar);
abrir=[nombre '.xls'];
winopen(abrir);
close(Exportar);


            
        
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
