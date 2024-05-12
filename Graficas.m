function varargout = Graficas(varargin)
% GRAFICAS MATLAB code for Graficas.fig
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Graficas_OpeningFcn, ...
                   'gui_OutputFcn',  @Graficas_OutputFcn, ...
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

% --- Executes just before Graficas is made visible.
function Graficas_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Graficas
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
set(handles.slider1,'Visible','off');
set(handles.text3,'Visible','off');
set(handles.pushbutton4,'Visible','off');
set(handles.pushbutton3,'Visible','off');
set(handles.text3,'String',1);
set(handles.axes1,'Visible','off');
set(handles.pushbutton17,'Visible','off');
set(handles.slider4,'Visible','off');
set(handles.pushbutton8,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.slider4,'Min',0);
set(handles.slider4,'Max',360);
set(handles.slider4,'Value',130.5);
set(handles.text8,'Visible','off');
set(handles.text8,'String','[Metros]');
set(handles.text9,'Visible','off');
global az color pasos
az=130.5;
color=parula;
set(handles.slider1,'SliderStep',[1/(pasos-1) 1/(pasos-1)]);

% --- Outputs from this function are returned to the command line.
function varargout = Graficas_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
clear
clc
distribucion_gaussiana;
close(Valores);
close(Cmax);
close(Colores);
close(Graficas);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
Modelo;
close(Graficas);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global corrector Z Y C tipo X az Cb color
slide=fix(get(hObject,'Value'));
switch corrector
    case {1}
        switch tipo
            case {1}
                set(handles.text3,'String',Z(slide));
                Cb=real(squeeze(C(:,:,slide)));
                surf(handles.axes1,Y,X,Cb)
                view(az,38);                
            case {2}
                set(handles.text3,'String',Z(slide));
                Cb=real(squeeze(C(:,:,slide)));
                mesh(handles.axes1,Y,X,Cb)
                view(az,38);                
            case {3}
                set(handles.text3,'String',Z(slide));
                Cb=real(squeeze(C(:,:,slide)));
                contourf(handles.axes1,Y,X,Cb)
                view(2);                
        end    
        ylabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        xlabel(handles.axes1,'Perpendicular al viento [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Y para Z= %2.1f metros',Z(slide));
        title(handles.axes1,titulo);        
    case {2}
        switch tipo
            case {1}
                set(handles.text3,'String',Y(slide));
                Cb=real(squeeze(C(slide,:,:)));
                surf(handles.axes1,X,Z,Cb)
                view(az,38);
            case {2}
                set(handles.text3,'String',Y(slide));
                Cb=real(squeeze(C(slide,:,:)));
                mesh(handles.axes1,X,Z,Cb)
                view(az,38);
            case {3}
                set(handles.text3,'String',Y(slide));
                Cb=real(squeeze(C(slide,:,:)));
                contourf(handles.axes1,X,Z,Cb)
                view(2);
        end 
        xlabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        ylabel(handles.axes1,'Eje vertical [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Z para Y= %2.1f metros',Y(slide));
        title(handles.axes1,titulo);
end
colormap(handles.axes1,color);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global tipo corrector C X Y Z Cb color
set(handles.slider1,'Visible','on');
set(handles.text3,'Visible','on');
set(handles.slider4,'Visible','off');
set(handles.axes1,'Visible','on');
set(handles.pushbutton8,'Visible','on');
set(handles.pushbutton7,'Visible','on');
slide=fix(get(handles.slider1,'Value'));
set(handles.text8,'Visible','on');
set(handles.text9,'Visible','on');

switch corrector
    case {1}       
        Cb=real(squeeze(C(:,:,slide)));
        contourf(handles.axes1,Y,X,Cb)
        view(2);
        ylabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        xlabel(handles.axes1,'Perpendicular al viento [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Y para Z= %2.1f metros',Z(slide));
        title(handles.axes1,titulo);
    case {2}
        Cb=real(squeeze(C(slide,:,:)));
        contourf(handles.axes1,X,Z,Cb)
        view(2);
        xlabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        ylabel(handles.axes1,'Eje vertical [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Z para Y= %2.1f metros',Y(slide));
        title(handles.axes1,titulo);
end
tipo=3;
colormap(handles.axes1,color);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global tipo corrector C X Y az Z Cb color
set(handles.slider1,'Visible','on');
set(handles.text3,'Visible','on');
set(handles.slider4,'Visible','on');
set(handles.axes1,'Visible','on');
slide=fix(get(handles.slider1,'Value'));
set(handles.pushbutton8,'Visible','on');
set(handles.pushbutton7,'Visible','on');
set(handles.text8,'Visible','on');
set(handles.text9,'Visible','on');
switch corrector
    case {1}       
        Cb=real(squeeze(C(:,:,slide)));
        surf(handles.axes1,Y,X,Cb)
        view(az,38);
        ylabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        xlabel(handles.axes1,'Perpendicular al viento [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Y para Z= %2.1f metros',Z(slide));
        title(handles.axes1,titulo);
    case {2}
        Cb=real(squeeze(C(slide,:,:)));
        surf(handles.axes1,X,Z,Cb)
        view(az,38);
        xlabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        ylabel(handles.axes1,'Eje vertical [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Z para Y= %2.1f metros',Y(slide));
        title(handles.axes1,titulo);
end
tipo=1;
colormap(handles.axes1,color);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
figure;
global corrector C tipo X Y az Z Cb color
slide=fix(get(handles.slider1,'Value'));
switch corrector
    case {1}
        switch tipo
            case {1}              
                Cb=real(squeeze(C(:,:,slide)));
                surf(Y,X,Cb)
                view(az,38);
            case {2}                
                Cb=real(squeeze(C(:,:,slide)));
                mesh(Y,X,Cb)
                view(az,38);
            case {3}                
                Cb=real(squeeze(C(:,:,slide)));
                contourf(Y,X,Cb)
                view(2);
        end
        ylabel('Dirección del viento [m]');
        xlabel('Perpendicular al viento [m]');
        zlabel('Concentración de contaminante [mg/m^3]');
        titulo=sprintf('Gráfico X-Y para Z= %2.1f metros',Z(slide));
        title(titulo);
    case {2}
        switch tipo
            case {1}               
                Cb=real(squeeze(C(slide,:,:)));
                surf(X,Z,Cb)
                view(az,38);
            case {2}                
                Cb=real(squeeze(C(slide,:,:)));
                mesh(X,Z,Cb)
                view(az ,38);
            case {3}                
                Cb=real(squeeze(C(slide,:,:)));
                contourf(X,Z,Cb)
                view(2);
        end
        xlabel('Dirección del viento [m]');
        ylabel('Eje vertical [m]');
        zlabel('Concentración de contaminante [mg/m^3]');
        titulo=sprintf('Gráfico X-Z para Y= %2.1f metros',Y(slide));
        title(titulo);
end
colormap(color);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global slide inso
slide=fix(get(handles.slider1,'Value'));
inso='none';
Exportar;

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
global Z corrector
set(handles.slider1,'Max',size(Z,2));
set(handles.slider1,'Value',1);
set(handles.slider1,'Min',1);
set(handles.text3,'String',1);
set(handles.pushbutton4,'Visible','on');
set(handles.pushbutton3,'Visible','on');
set(handles.pushbutton17,'Visible','on');
set(handles.text9,'String','La altura es de z= ');
set(handles.slider1,'Visible','off');
set(handles.text3,'Visible','off');
set(handles.axes1,'Visible','off');
set(handles.slider1,'Visible','off');
set(handles.slider4,'Visible','off');
set(handles.pushbutton8,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.text8,'Visible','off');
set(handles.text9,'Visible','off');
corrector=1;

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
global Y corrector
set(handles.slider1,'Max',size(Y,2));
set(handles.slider1,'Value',1);
set(handles.slider1,'Min',1);
set(handles.text3,'String',1);
set(handles.pushbutton4,'Visible','on');
set(handles.pushbutton3,'Visible','on');
set(handles.pushbutton17,'Visible','on');
set(handles.text9,'String','La distancia es de y= ');
set(handles.slider1,'Visible','off');
set(handles.axes1,'Visible','off');
set(handles.slider4,'Visible','off');
set(handles.pushbutton8,'Visible','off');
set(handles.pushbutton7,'Visible','off');
set(handles.text8,'Visible','off');
set(handles.text9,'Visible','off');
set(handles.text3,'Visible','off');
corrector=2;
% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
Valores;

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
open('DispCont.pdf');

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global tipo corrector C X Y az Z Cb color
set(handles.slider1,'Visible','on');
set(handles.text3,'Visible','on');
set(handles.slider4,'Visible','on');
set(handles.axes1,'Visible','on');
slide=fix(get(handles.slider1,'Value'));
set(handles.pushbutton8,'Visible','on');
set(handles.pushbutton7,'Visible','on');
set(handles.text8,'Visible','on');
set(handles.text9,'Visible','on');
switch corrector
    case {1}       
        Cb=real(squeeze(C(:,:,slide)));
        mesh(handles.axes1,Y,X,Cb)
        view(az,38);
        ylabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        xlabel(handles.axes1,'Perpendicular al viento [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Y para Z= %2.1f metros',Z(slide));
        title(handles.axes1,titulo);
    case {2}
        Cb=real(squeeze(C(slide,:,:)));
        mesh(handles.axes1,X,Z,Cb)
        view(az,38);
        xlabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        ylabel(handles.axes1,'Eje vertical [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Z para Y= %2.1f metros',Y(slide));
        title(handles.axes1,titulo);
end
tipo=2;
colormap(handles.axes1,color);


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
global corrector Y C tipo X az Z Cb color 
az=fix(10*get(hObject,'Value'))/10;
slide=fix(get(handles.slider1,'Value'));
switch corrector
    case {1}
        switch tipo
            case {1}
                Cb=real(squeeze(C(:,:,slide)));
                surf(handles.axes1,Y,X,Cb)
                view(az,38);
            case {2}             
                Cb=real(squeeze(C(:,:,slide)));
                mesh(handles.axes1,Y,X,Cb)
                view(az,38);
            case {3}              
                Cb=real(squeeze(C(:,:,slide)));
                contourf(handles.axes1,Y,X,Cb)
                view(2);
        end
        ylabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        xlabel(handles.axes1,'Perpendicular al viento [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Y para Z= %2.1f metros',Z(slide));
        title(handles.axes1,titulo);
    case {2}
        switch tipo
            case {1}                
                Cb=real(squeeze(C(slide,:,:)));
                surf(handles.axes1,X,Z,Cb)
                view(az,38);
            case {2}                
                Cb=real(squeeze(C(slide,:,:)));
                mesh(handles.axes1,X,Z,Cb)
                view(az,38);
            case {3}               
                Cb=real(squeeze(C(slide,:,:)));
                contourf(handles.axes1,X,Z,Cb)
                view(2);
        end  
        xlabel(handles.axes1,'Dirección del viento [m]','FontSize',8);
        ylabel(handles.axes1,'Eje vertical [m]','FontSize',8);
        zlabel(handles.axes1,'Concentración de contaminante [mg/m^3]','FontSize',8);
        titulo=sprintf('Gráfico X-Z para Y= %2.1f metros',Y(slide));
        title(handles.axes1,titulo);
end
colormap(handles.axes1,color);

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
Cmax;
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
Colores;
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
