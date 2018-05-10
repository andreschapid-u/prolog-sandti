?-window(_, _,crea_ventana(),"Aplicación",250, 100, 600, 600), 
window_brush(_, "goku.bmp"),update_window(_).


crea_ventana(init):- 
%window_brush(_, rgb(100, 100, 180)), 
menu(pop_up, _,_,informacion(_),"&ARCHIVO"),
menu(pop_up, _,_,listas1(_),"&LISTAS"),
menu(pop_up, _,_,logico(_),"&LOGICO").


%CREA SUBMENU INFORMACION
informacion(init):-
menu(normal, _,_,informacion_autor(_),"informacion"),
menu(normal, _,_,cerrar_ven(_),"&Salir").
cerrar_ven(press):-
	close_window(X).

%CREA SUBMENU PROMEDIO LISTA, maximo, impares, concatenar

listas1(init):-
menu(normal, _,_,promedio_lista(_),"Calcular el Promedio de una Lista"),
menu(normal, _,_,mayor_lista(_),"Calcular el Mayor en una Lista"),
menu(normal, _,_,impares_lista(_),"Impares Lista"),
menu(normal, _,_,concatenar_lista(_),"Concatenar Lista").

%CREA SUBMENU CRIMINAL EN POTENCIA

logico(init):-
menu(normal, _,_,criminal_potencia(_),"Criminal en Potencia"),
menu(normal, _,_,garavito(_),"Garavito"),
menu(normal, _,_,quien_es_criminal_potencia(_),"Quien es Criminal en Potencia").











%hecho y/o función base
buscar(X,[X|Cola]).

%regla para Buscar

buscar(X,[Cabeza|Cola]):- buscar(X,Cola).

%Predicado para mirar el mayor de una lista

max_lista([X],X).
max_lista([X1,X2|L],Y):-
	X3 is max(X1,X2),
	max_lista([X3|L],Y).
	

%Predicado que encuentra la suma de los elementos de
%la lista en Sum.
suma([],0):-!.
suma([X],X):-!.
suma([X|L],Sum):-suma(L,Sum1),Sum is X+Sum1.
 
%Predicado que encuentra la cantidad de elementos
%de una lista
cantidad([],0):-!.
cantidad([_],1):-!.
cantidad([_|L],Cant):-cantidad(L,Cant1),Cant is Cant1+1.
 
%predicado que saca el promedio de los elementos de una lista
%en Prom
promedio([X],X):-!.
promedio(L,Prom):-suma(L,Sum),cantidad(L,C),Prom is Sum/C.




%predicado para saber cuantos numeros impares tiene una lista

%caso Base

impares([],0).

%regla

impares([Cabeza|Cola],Cont):-impares(Cola,C),Cabeza mod 2 =:=0, Cont is C+0.
impares([Cabeza|Cola],Cont):-impares(Cola,C),Cont is C+1.

%predicado para concatenar dos listas
my_append([], X2, X2).

my_append([A|X1],Bs,[A|X2]):-
          my_append(X1, Bs, X2).
%?-my_append([a,b,c],[d,e],Bs),write(Bs).



%hechos donde se define las personas que pueden ser criminales potenciales

persona_traumatizada(anderson,"violentado en su familia").
persona_traumatizada(marta,"violentado en su entorno social").
persona_traumatizada(pedro,"violentado en su familia").
persona_traumatizada(claudia,"violentado en su entorno social").
persona_traumatizada(ana,"violentado en su familia").
persona_traumatizada(juan,"violentado en su entorno social").
persona_traumatizada(pepe,"violentado en su familia").
persona_traumatizada(mario,"violentado en su entorno social").

persona_acomplejada(anderson,"condicion economica").
persona_acomplejada(marta,"condicion fisica").
persona_acomplejada(oscar,"condicion economica").
persona_acomplejada(claudia,"condicion fisica").
persona_acomplejada(andres,"condicion economica").
persona_acomplejada(ana,"condicion fisica").
persona_acomplejada(juan,"condicion economica").
persona_acomplejada(mario,"condicion fisica").

persona_maltratada(anderson,"sus padres lo golpean").
persona_maltratada(marta,"sus padres lo insultan").
persona_maltratada(pedro,"sus padres lo golpean").
persona_maltratada(claudia,"sus padres lo insultan").
persona_maltratada(ana,"sus padres lo golpean").
persona_maltratada(jaime,"sus padres lo insultan").
persona_maltratada(juan,"sus padres lo golpean").
persona_maltratada(tulio,"sus padres lo insultan").

recibe(pablo,"amor y comprension").
recibe(marta,"amor y comprension").
recibe(pepa,"amor y comprension").
recibe(juan,"amor y comprension").
recibe(pedro,"amor y comprension").
recibe(luis,"amor y comprension").
recibe(mario,"amor y comprension").
recibe(jaime,"amor y comprension").


%reglas
maltrato_tra(X):-persona_traumatizada(X,"violentado en su familia");
			persona_traumatizada(X,"violentado en su entorno social").

maltrato_acom(X):-persona_acomplejada(X,"condicion economica");
			persona_acomplejada(X,"condicion fisica").

maltrato(X):-persona_maltratada(X,"sus padres lo golpean");
			persona_maltratada(X,"sus padres lo insultan").

es_criminal(X):-maltrato_tra(X),maltrato_acom(X),maltrato(X),not(recibe(X,"amor y comprension")).





%alpresionar el boton informacion muestra la info del autor

informacion_autor(press):-  
	message("Información","Autor: Roby Anderson Perez ",i).

%sub funcion para calcular promedio de la lista

promedio_lista(press):-  
window( _, _, ventana_prom(_), "PROMEDIO_LISTA", 150,50,450,450),
	button(_,_,boton_prom(_),"&Promedio Lista",320,35,95,30).
	text_out(50,100,"digite la lista asi :"),
	text_out(80,120,"ejemplo: [2,3,...] ").


%sub funcion para calcular el mayor en una lista

mayor_lista(press):-  
window( _, _, ventana_mayor(_), "MAYOR_LISTA", 150,50,450,450),
	button(_,_,boton_mayor(_),"&Mayor Lista",320,35,95,30),
	text_out(50,100,"digite la lista asi :"),
	text_out(80,120,"ejemplo: [2,3,...] ").
	

%sub funcion para calcular cuantos impares tiene una lista

impares_lista(press):-  
window( _, _, ventana_impar(_), "IMPAR_LISTA", 150,50,450,450),
	button(_,_,boton_impar(_),"&IMPARES",320,35,95,30),
	text_out(50,100,"digite la lista asi :"),
	text_out(80,120,"ejemplo: [2,3,1] ").


%sub funcion para calcular el mayor en una lista

concatenar_lista(press):-  
window( _, _, ventana_concatenar(_), "CONCATENAR_LISTA", 150,50,450,450),
	button(_,_,boton_concatenar(_),"&Concatenar",320,35,95,30),
	text_out(50,100,"digite las listas asi :"),
	text_out(80,120,"ejemplo: [2,3,8] ").

%alpresionar el boton criminal_potencia
	
criminal_potencia(press):-  
window( _, _, ventana_criminal(_), "Criminal En Potencia", 150,50,450,450),
	button(_,_,boton_criminal(_),"&Listar criminales",80,100,130,80).
	

		





% ----parte gráfica promedio

ventana_prom(init):-
window_brush(_, rgb(100, 100, 180)).

% ----parte gráfica mayor

ventana_mayor(init):-
window_brush(_, rgb(100, 100, 180)).

% ----parte gráfica impar

ventana_impar(init):-
window_brush(_, rgb(100, 100, 180)).

% ----parte gráfica concatenar

ventana_concatenar(init):-
window_brush(_, rgb(100, 100, 180)).

% ----parte gráfica criminal

ventana_criminal(init):-
window_brush(_, rgb(100, 100, 180)).








%?-promedio([X],Prom),write(Prom).

%al oprimir boton_prom calcula promedio lista
boton_prom(press):-
	read(X,"Digite los valores que va a ingresar en forma de lista y separados por comas :"),
	promedio(X,Prom),
	text_out(160,200,"El promedio es"),
	edit(G_lista,_,edit_func(_),"",210,220,100,28),
	set_text(print(Prom),G_lista).

%al oprimir boton_mayor calcula el mayor de la lista
boton_mayor(press):-
	read(Z,"Digite los valores que va a ingresar en forma de lista y separado por comas:"),
	max_lista(Z,X),
	
	text_out(160,200,"el mayor es:"),
	edit(G_lista,_,edit_func(_),"",210,220,100,28),
	set_text(print(X),G_lista).

	
%al oprimir boton_impar calcula cuantos numeros impares tiene la lista
boton_impar(press):-
	read(X,"Digite los valores que va a ingresar en forma de lista y separado por comas:"),
	impares(X,Cont),
	text_out(80,200,"la cantidad de numeros impares en la lista es: "),
	edit(G_lista,_,edit_func(_),"",210,220,100,28),
	set_text(print(Cont),G_lista).


%al oprimir boton_concatenar concatena dos listas
boton_concatenar(press):-
	read(X,"Digite los valores de la primera lista que va a ingresar separados por comas:"),
	read(X1,"Digite la valores de la segunda lista que va a ingresar separado por comas:"),
	
	my_append(X,X1,Bs),
	text_out(160,200,"la nueva lista es: "),
	edit(G_lista,_,edit_func(_),"",210,220,100,28),
	set_text(print(Bs),G_lista).

%al oprimir boton_criminal
boton_criminal(press):-
		es_criminal(X),
		message("criminales",print(X),j),ln. 
		  



