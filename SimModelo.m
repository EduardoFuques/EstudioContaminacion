function varargout = SimModelo(varargin)
% SIMMODELO MATLAB code for SimModelo.fig
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SimModelo_OpeningFcn, ...
                   'gui_OutputFcn',  @SimModelo_OutputFcn, ...
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

% --- Executes just before SimModelo is made visible.
function SimModelo_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for SimModelo
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
global Xf Yf Zf plum_rise_model reflection deposition pasos
set(handles.edit2,'String',pasos);
set(handles.slider1,'Value',Xf/1e3);
set(handles.text8,'String',Xf/1e3);
set(handles.slider2,'Value',Yf/1e3);
set(handles.text9,'String',Yf/1e3);
set(handles.slider3,'Value',Zf/1e3);
set(handles.text10,'String',Zf/1e3);
switch plum_rise_model
    case {'none'}
        set(handles.popupmenu1,'Value',1);
    case {'CONCAWE'}
        set(handles.popupmenu1,'Value',2);
    case {'CarlsonMoses'}
        set(handles.popupmenu1,'Value',3);
    case {'Holland'}
        set(handles.popupmenu1,'Value',4);
    case {'Briggs'}
        set(handles.popupmenu1,'Value',5);
end
switch reflection
    case {'false'}
        set(handles.popupmenu2,'Value',1);
    case {'true'}
        set(handles.popupmenu2,'Value',2);
end
switch deposition
    case {'false'}
        set(handles.popupmenu3,'Value',1);
    case {'true'}
        set(handles.popupmenu3,'Value',2);
end


% --- Outputs from this function are returned to the command line.
function varargout = SimModelo_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit1_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open('PlumeRise.pdf');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global X Y Z plum_rise_model reflection deposition Q u_ref h h_ref p mw...
    amb_temp stack_temp stack_diameter specific_heat amb_pres stack_pres...
    stack_velocity C1 C2 C3 C4 C5 C6 term_velocity pasos Xf Yf Zf st1...
    st2 st3 st4 st5 st6 PerIns Cprom z1 z2 z3 z4 z5 z6 zprom
pasos=str2double(get(handles.edit2,'String'));
Xf=str2double(get(handles.text8,'String'))*1e3;
Yf=str2double(get(handles.text9,'String'))*1e3;
Zf=str2double(get(handles.text10,'String'))*1e3;
X=linspace(1,Xf,pasos);
Y=linspace(1,Yf,pasos);
Z=linspace(1,Zf,pasos);
rise=get(handles.popupmenu1,'Value');
switch rise
    case {1}
        plum_rise_model='none';
    case {2}
        plum_rise_model='CONCAWE';
    case {3}
        plum_rise_model='CarlsonMoses';
    case {4}
        plum_rise_model='Holland';
    case {5}
        plum_rise_model='Briggs';
end
refle=get(handles.popupmenu2,'Value');
switch refle
    case {1}
        reflection='false';
    case {2}
        reflection='true';
end
depo=get(handles.popupmenu3,'Value');
switch depo
    case {1}
        deposition='false';
    case {2}
        deposition='true';
end
% Perfil de concentraciones para Insolación Fuerte
[C1,z1]=gaussianPlume(Q,u_ref,h,'h_ref',h_ref,'stability',st1,...
     'p',p,'plume_rise_model',plum_rise_model,'mw',mw,...
     'amb_temp',amb_temp,'stack_temp',stack_temp,'stack_diameter',...
     stack_diameter,'specific_heat',specific_heat,'amb_pres',amb_pres,...
     'stack_pres',stack_pres,'stack_velocity',stack_velocity,'reflection'...
     ,reflection,'deposition',deposition,'X',X,'Y',Y,'Z',Z,'term_velocity',term_velocity);
C1=C1*1000;
 
% Perfil de concentraciones para Insolación Moderada
[C2,z2]=gaussianPlume(Q,u_ref,h,'h_ref',h_ref,'stability',st2,...
     'p',p,'plume_rise_model',plum_rise_model,'mw',mw,...
     'amb_temp',amb_temp,'stack_temp',stack_temp,'stack_diameter',...
     stack_diameter,'specific_heat',specific_heat,'amb_pres',amb_pres,...
     'stack_pres',stack_pres,'stack_velocity',stack_velocity,'reflection'...
     ,reflection,'deposition',deposition,'X',X,'Y',Y,'Z',Z,'term_velocity',term_velocity);
C2=C2*1000; 
 
% Perfil de concentraciones para Insolación Ligera
[C3,z3]=gaussianPlume(Q,u_ref,h,'h_ref',h_ref,'stability',st3,...
     'p',p,'plume_rise_model',plum_rise_model,'mw',mw,...
     'amb_temp',amb_temp,'stack_temp',stack_temp,'stack_diameter',...
     stack_diameter,'specific_heat',specific_heat,'amb_pres',amb_pres,...
     'stack_pres',stack_pres,'stack_velocity',stack_velocity,'reflection'...
     ,reflection,'deposition',deposition,'X',X,'Y',Y,'Z',Z,'term_velocity',term_velocity);
C3=C3*1000;
 
% Perfil de concentraciones para Insolación Debil
[C4,z4]=gaussianPlume(Q,u_ref,h,'h_ref',h_ref,'stability',st4,...
     'p',p,'plume_rise_model',plum_rise_model,'mw',mw,...
     'amb_temp',amb_temp,'stack_temp',stack_temp,'stack_diameter',...
     stack_diameter,'specific_heat',specific_heat,'amb_pres',amb_pres,...
     'stack_pres',stack_pres,'stack_velocity',stack_velocity,'reflection'...
     ,reflection,'deposition',deposition,'X',X,'Y',Y,'Z',Z,'term_velocity',term_velocity);
C4=C4*1000;
 
% Perfil de concentraciones para Nubosidad
[C5,z5]=gaussianPlume(Q,u_ref,h,'h_ref',h_ref,'stability',st5,...
     'p',p,'plume_rise_model',plum_rise_model,'mw',mw,...
     'amb_temp',amb_temp,'stack_temp',stack_temp,'stack_diameter',...
     stack_diameter,'specific_heat',specific_heat,'amb_pres',amb_pres,...
     'stack_pres',stack_pres,'stack_velocity',stack_velocity,'reflection'...
     ,reflection,'deposition',deposition,'X',X,'Y',Y,'Z',Z,'term_velocity',term_velocity);
C5=C5*1000;
 
% Perfil de concentraciones para Noche
[C6,z6]=gaussianPlume(Q,u_ref,h,'h_ref',h_ref,'stability',st6,...
     'p',p,'plume_rise_model',plum_rise_model,'mw',mw,...
     'amb_temp',amb_temp,'stack_temp',stack_temp,'stack_diameter',...
     stack_diameter,'specific_heat',specific_heat,'amb_pres',amb_pres,...
     'stack_pres',stack_pres,'stack_velocity',stack_velocity,'reflection'...
     ,reflection,'deposition',deposition,'X',X,'Y',Y,'Z',Z,'term_velocity',term_velocity);
C6=C6*1000;
 
% Promedio diario en condiciones de estado estable
Cprom=PerIns(1).*C1+PerIns(2).*C2+PerIns(3).*C3+PerIns(4).*C4+PerIns(5).*C5+PerIns(7).*C6;
zprom=PerIns(1).*z1+PerIns(2).*z2+PerIns(3).*z3+PerIns(4).*z4+PerIns(5).*z5+PerIns(7).*z6;
SimGraficas;
close(SimModelo);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
Simular;
close(SimModelo);

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
valorx=100*get(hObject, 'Value');
areax=fix(valorx)/100;
set(handles.text8,'String',areax);
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
areay=100*get(hObject, 'Value');
areay=fix(areay)/100;
set(handles.text9,'String',areay);
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
areaz=100*get(hObject, 'Value');
areaz=fix(areaz)/100;
set(handles.text10,'String',areaz);
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit2_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
