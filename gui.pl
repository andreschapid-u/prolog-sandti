ejemplo_mensajes :-
% Crea el objeto dialogo en la variable D
new(D, dialog('Nombre del Dialogo')),
% Crea un boton que llama al predicado mostrar_mensaje
new(B, button('Mostrar en Consola',
message(@prolog, mostrar_mensaje, 'Este es el valor que tendra la variable P'))),
% Crea un boton para cerrar el dialogo
new(@boton, button('Cerrar Dialogo',
and(
message(D, destroy),
message(D, free),
message(D, free),
message(@boton, free)))),
 % Inserta los botones en el diálogo
send(D, append(@boton)),
send(D, append(B)),
% Muestre la ventana.
send(D, open).
% Muestra un mensaje en la consola.
mostrar_mensaje(P) :-
write('La variable P vale '), write(P), nl.
