%hechos
terreno_optimo(10,10,10,10).
recomendacion(arido).
caracteristicas_terreno(prueba1,prueba2,prueba3,resultado1).
caracteristicas_terreno(prueba1,prueba2,prueba3,resultado2).

?-window(_, _,crea_ventana(),"SANTID",200,200, 600,600), 
window_brush(_, rgb(100, 100, 100)),update_window(_).

crea_ventana(init):- 
window_brush(_, rgb(100, 100, 100)), 
menu(pop_up, _,_,tipo_usuario(_),"&TIPO USUARIO").

tipo_usuario(init):-
menu(normal,_,_,inversionista(_),"&INVERSIONISTA"),
menu(normal,_,_,propietario(_),"&PROPIETARIO").

crea_ventana2(init):-
window_brush(_, rgb(100, 100, 100)).

propietario(press):-
window( _, _, crea_ventana2(), "Inversionista", 150,50,450,650),

text_out(10,20,"Departamento:"),
edit(G_Departamento,_,edit_func(_),"",140,20,100,30),

text_out(10,60,"Humedad Relativa:"),
edit(G_humedad_relativa,_,edit_func(_),"",140,60,100,30),

text_out(10,100,"Grado ph:"),
edit(G_grado_ph,_,edit_func(_),"",140,100,100,30),

text_out(10,140,"Textura:"),
edit(G_textura,_,edit_func(_),"",140,140,100,30),


button(_,_,btn_Consultar(_),"&Consultar",30,200,100,30),

edit(G_Resultado_Consulta,_,edit_func(_),"Resultado:",30,240,300,350),

read(Departamento,"Digite Departamento:"),
set_text(print(Departamento),G_Departamento),

read(Humedad,"Digite Grado de humedad:"),
set_text(print(Humedad),G_humedad_relativa),

read(Ph,"Digite Grado de ph:"),
set_text(print(Ph),G_grado_ph),

read(Textura,"Digite el grado de arenocidad:"),
set_text(print(Textura),G_textura),

(terreno_optimo(Departamento,Humedad,Ph,Textura)->
message("Información","Apto",i)
else
message("Información","No apto",s)).


%interfaz propietario--------------------------
inversionista(press):-
window( _, _, crea_ventana2(), "Propietario", 150,50,450,650),

text_out(10,20,"Planteacion:"),
edit(G_planeacion,_,edit_func(_),"",110,20,100,30),

text_out(10,60,"Departamento:"),
edit(G_departamento,_,edit_func(_),"",110,60,100,30),

text_out(10,100,"Area:"),
edit(G_area,_,edit_func(_),"",110,100,100,30),

button(_,_,btn_Buscar(_),"&Buscar",30,150,100,30),

edit(G_Resultado_Busqueda,_,edit_func(_),"Resultado:",30,190,300,350),


read(Planteacion,"Digite Planteacion:"),
set_text(print(Planteacion),G_planeacion),

read(Departamento,"Digite Departamento:"),
set_text(print(Departamento),G_departamento),

read(Area,"Digite Area:"),
set_text(print(Area),G_area),

(caracteristicas_terreno(Planteacion,Departamento,Area,X)->
add_text(G_Resultado_Busqueda,print(X) + ", ")
%message("Información","Apto",i)
else
message("Información","No apto",s)).


btn_Buscar(press):-
edit(G_Resultado_Busqueda_btn,_,edit_func(_),"Resultado:",30,190,300,350),
	caracteristicas_terreno(Planteacion,Departamento,Area,X),
	add_text(G_Resultado_Busqueda_btn,print(X) + ", "),
	fail.















