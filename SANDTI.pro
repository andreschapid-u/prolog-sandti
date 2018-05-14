%Carlos Chapid Edinson Hidalgo Rene Narvaez

%hechos
departamento(amazonas).
departamento(antioquia).
departamento(arauca).
departamento(atlantico).
departamento(bolivar).
departamento(boyaca).
departamento(caldas).
departamento(caqueta).
departamento(casanare).
departamento(cauca).
departamento(cesar).
departamento(choco).
departamento(cordoba).
departamento(cundinamarca).
departamento(guainia).
departamento(guaviare).
departamento(huila).
departamento(la_Guajira).
departamento(magdalena).
departamento(meta).
departamento(nariño).
departamento(norte_Santander).
departamento(putumayo).
departamento(quindio).
departamento(risaralda).
departamento(san_Andres_Providencia).
departamento(santander).
departamento(sucre).
departamento(tolima).
departamento(valle_Cauca).
departamento(vaupes).
departamento(vichada).

producto(cafe).
producto(algodon).
producto(cereales).
producto(papa).
producto(leguminosas).
producto(cacao).
producto(frutales).

cultivar(atlantico, algodon).
cultivar(putumayo, leguminosas).
cultivar(putumayo, frutales).
cultivar(nariño, cereales).
cultivar(nariño, frutales).
cultivar(nariño, papa).
cultivar(nariño, cafe).
cultivar(cauca, papa).
cultivar(cauca, frutales).
cultivar(cauca, cereales).
cultivar(cauca, cafe).
cultivar(caqueta, cereales).
cultivar(caqueta, algodon).
cultivar(huila, trigo).
cultivar(huila, cacao).
cultivar(huila, cafe).
cultivar(valle_Cauca, cacao).
cultivar(valle_Cauca, cafe).
cultivar(tolima, algodon).
cultivar(tolima, leguminosas).
cultivar(tolima, cafe).
cultivar(tolima, cacao).
cultivar(quindio, algodon).
cultivar(risaralda, cereales).
cultivar(caldas, cacao).
cultivar(caldas, algodon).
cultivar(caldas, cereales).
cultivar(meta, algodon).
cultivar(meta, cereales).
cultivar(meta, cafe).
cultivar(meta, frutales).
cultivar(casanare, frutales).
cultivar(casanare, cafe).
cultivar(casanare, cereales).
cultivar(casanare, algodon).
cultivar(arauca, cereales).
cultivar(cundinamarca, frutales).
cultivar(cundinamarca, cafe).
cultivar(cundinamarca, algodon).
cultivar(cundinamarca, cacao).
cultivar(cundinamarca, papa).
cultivar(boyaca, cacao).
cultivar(boyaca, papa).
cultivar(boyaca, cereales).
cultivar(boyaca, frutales).
cultivar(boyaca, leguminosas).
cultivar(norte_Santander, cereales).
cultivar(norte_Santander, algodon).
cultivar(santander, papa).
cultivar(santander, cafe).
cultivar(santander, frutales).
cultivar(santander, cereales).
cultivar(sucre, cereales).
cultivar(sucre, algodon).
cultivar(cesar, cereales).
cultivar(cesar, algodon).
cultivar(cesar, frutales).
cultivar(cordoba, cereales).
cultivar(cordoba, algodon).
cultivar(cordoba, cafe).
cultivar(antioquia, cacao).
cultivar(antioquia, leguminosas).
cultivar(antioquia, cafe).
cultivar(antioquia, algodon).
cultivar(antioquia, frutales).
cultivar(antioquia, cereales).
cultivar(bolivar, cereales).
cultivar(bolivar, algodon).
cultivar(magdalena, algodon).
cultivar(magdalena, cereales).
cultivar(magdalena, cafe).

pro_sue(cafe,arcillosa).
pro_sue(algodon,arcillosa).
pro_sue(cereales,arcillosa).
pro_sue(papa,arenosa).
pro_sue(leguminosas,arenosa).
pro_sue(cacao,arenosa).
pro_sue(frutales,arenosa).

que_cultivar(D, S, X) :- cultivar(D, X),pro_sue(X,S), write(X).
es_apto(H) :- H > 64.
apto(H,A) :- H < 65, A is 65 - H.

es_acido(Ph) :- Ph < 7.
es_alcalino(Ph) :- Ph > 6.

terreno(cauca,cafe,20,123456789).
terreno(cauca,papa,20,123456789).
terreno(cauca,cafe,20,0000000).
terreno(sucre,algodon,100,987654321).
terreno(bolivar,cereales,50,123459876).
terreno(boyaca, frutales,70,987651234).
terreno(cordoba, cereales,50,123789456).
terreno(meta, cafe,200,987321654).
terreno(putumayo, leguminosas,30,981234567).
terreno(antioquia, cacao,210,567812349).
terreno(magdalena, algodon,95,918237645).

?-window(_, _,crea_ventana(),"SANTID",200,200, 542, 415),
window_brush(_, "fondo.bmp"),update_window(_). 
%window_brush(_, rgb(100, 100, 100)),update_window(_).


crea_ventana(init):- 
window_brush(_, rgb(100, 100, 100)), 
menu(normal, _,_,inversionista(_),"&INVERSIONISTA"),
menu(normal, _,_,propietario(_),"&PROPIETARIO").

tipo_usuario(init):-
menu(normal,_,_,inversionista(_),"&INVERSIONISTA"),
menu(normal,_,_,propietario(_),"&PROPIETARIO").

crea_ventana2(init):-
window_brush(_, "fondo.bmp").

%MODULO DEL PROPIETARIO
propietario(press):-
window( _, _, crea_ventana2(), "PROPIETARIO", 150,50,450,650),
window_brush(_, "fondo.bmp"),
text_out(10,20,"Departamento:"),
edit(G_Departamento,_,edit_func(_),"",140,20,100,30),

text_out(10,60,"Humedad Relativa:"),
edit(G_humedad_relativa,_,edit_func(_),"",140,60,100,30),

text_out(10,100,"Grado ph:"),
edit(G_grado_ph,_,edit_func(_),"",140,100,100,30),

text_out(10,140,"Textura:"),
edit(G_textura,_,edit_func(_),"",140,140,100,30),


button(_,_,btn_consultar(_),"&Consultar",30,200,100,30),


%edit(G_Resultado_Consulta,_,edit_func(_),"Resultado:  ",30,240,350,30),
edit_n(G_Resultado_Consulta,_,edit_func,"Resultado:\n",30,240,350,350,2,0,0),
%edit(G_Resultado_apto,_,edit_func(_),"Resultado:  ",30,280,350,30),
%edit(G_Resultado_acido,_,edit_func(_),"Resultado:  ",30,320,350,30),


read(Departamento,"Digite Departamento:"),
set_text(print(Departamento),G_Departamento),

read(Humedad,"Digite Grado de humedad:"),
set_text(print(Humedad),G_humedad_relativa),

read(Ph,"Digite Grado de ph:"),
set_text(print(Ph),G_grado_ph),

read(Textura,"Digite el grado de arenocidad:"),
set_text(print(Textura),G_textura),


(es_apto(Humedad)->	
add_text(G_Resultado_Consulta,print("- El terreno es Apto para empezar a cultivar\n"))
else
apto(Humedad, Faltante),
	add_text(G_Resultado_Consulta,print("- El terreno NO es apto para cultivar\n" + "Incremente la Humedad un " + Faltante+"% para iniciar con la etapa del planton.\n"))
),
write("qwert"),
(es_acido(Ph)->
	add_text(G_Resultado_Consulta,print("- El tipo de suelo es: Tierra Acida.\n")),
	write("Es Acido")
else
	add_text(G_Resultado_Consulta,print("- El tipo de suelo es: Tierra Alcalina.\n"))
),
(departamento(Departamento) ->add_text(G_Resultado_Consulta,"- Segun la ubicación, es posible cultivar:\n")
else
add_text(G_Resultado_Consulta,"- "+print(Departamento)+" - No es un departamento válido!\n")
),
que_cultivar(Departamento,Textura,X),
add_text(G_Resultado_Consulta,print(X)+", "),ln,nl
.


%interfaz INVERSIONISTA--------------------------
inversionista(press):-
window( _, _, crea_ventana2(), "INVERSIONISTA", 150,50,450,650),

text_out(10,20,"Producto:"),
edit(G_planeacion,_,edit_func(_),"",110,20,100,30),

text_out(10,60,"Departamento:"),
edit(G_departamento,_,edit_func(_),"",110,60,100,30),

text_out(10,100,"Area:"),
edit(G_area,_,edit_func(_),"",110,100,100,30),

button(_,_,btn_Buscar(_),"&Buscar",30,150,100,30),


%edit(G_Resultado_Busqueda,_,edit_func(_),"Resultado:",30,190,300,350),
edit_n(G_Resultado_Busqueda,_,edit_func,"Resultado:\n",30,190,300,350,2,0,0),


read(Planteacion,"Digite el producto:"),
set_text(print(Planteacion),G_planeacion),

read(Departamento,"Digite Departamento:"),
set_text(print(Departamento),G_departamento),

read(Area,"Digite Area:"),
set_text(print(Area),G_area),


(departamento(Departamento) ->
terreno(Departamento,Planteacion,Area,X),
add_text(G_Resultado_Busqueda,print(Departamento)+" "+print(Planteacion)+" "+print(Area)+" "+print(X)+"\n"),ln
else
add_text(G_Resultado_Busqueda,"- "+print(Departamento)+" - No es un departamento válido!\n")
)
.


btn_consultar(press):- 
producto(X),
list_box(G_List,_,list_func,"Lista",30,240,300,350),
change_style(G_List,0,0,0x200),
insert_list_item(G_List,end,print(X),_).

list_func(edit(Item,Text)):-
set_list_label(G_List,Item,0,Text),write(Text).


btn_Buscar(press):-
	close_window(X).














