%Consolidado Fallas
fallas(marco,4). 
fallas(yolanda,0). 
fallas(agustin,3). 
fallas(johana,5). 
fallas(julian,0). 
fallas(martha,9).
fallas(alberth,4). 
fallas(leidy,3). 
fallas(pablo,5).
fallas(pilar,2).
fallas(amir,3).

%Consolidado Calificaciones Estudiantes
calificacionEstudiante(marco, 4.2).
calificacionEstudiante(yolanda, 2.6).
calificacionEstudiante(agustin, 2.8).
calificacionEstudiante(johana, 4.6).
calificacionEstudiante(julian, 2.7).
calificacionEstudiante(martha, 2.6).
calificacionEstudiante(alberth, 5.0).
calificacionEstudiante(leidy, 5.0).
calificacionEstudiante(pablo, 0.5).
calificacionEstudiante(pilar, 0.2).
calificacionEstudiante(amir, 3.2).

%Longitud
longitud([], 0).
longitud([_|T], N):- longitud(T, N0), N is N0 + 1.

%Suma
suma([], 0).
suma([H|T], S):- suma(T, S0), S is S0 + H.

%Promedio
promedio([], 0).
promedio([H|T], P):- suma([H|T], S), longitud([H|T], L), P is S/L.

%Porcentaje
porcentaje(X, Y, Z):- Z is (X/Y)*100.

%Calculo Asistencia
asistencia(X,Y):-
	X == 0 -> Y = asistencia_completa; 
	X > 0, X =< 4 -> Y = asistencia_suficiente;
	X == 5 -> Y = oportunidad;
	X > 5 -> Y = pierde_por_fallas.

pasoLaAsistencia(X, Y, Z):- (fallas(X, Y), (Y == 0 -> Z = 'Asistencia Completa';
                            Y > 0, Y =< 4 -> Z = 'Asistencia Suficiente';
                            Y == 5 -> Z = 'Oportunidad de pasar';
                            Y > 5 -> Z = 'Perdida por Fallas'
                            )
                        ).

perdidafallas(X):-fallas(X,Z),asistencia(Z,W),W=pierde_por_fallas.
daroportunidad(X):-fallas(X,Z),asistencia(Z,W),W=oportunidad.
asistenciasuficiente(X):-fallas(X,Z),asistencia(Z,W),W=asistencia_suficiente.
asistenciacompleta(X):-fallas(X,Z),asistencia(Z,W),W=asistencia_completa.
estudiantes(X):-fallas(X,_).
fallas(Y):-fallas(_,Y).
listaperdidasporfallas(L):-findall(X,perdidafallas(X),L).
listaposibleoportunidad(L):-findall(X,daroportunidad(X),L).
listaasistenciasuficiente(L):-findall(X,asistenciasuficiente(X),L).
listaasistenciacompleta(L):-findall(X,asistenciacompleta(X),L).
listaestudiantes(L):-findall(Y,fallas(Y),L).
listafallas(L):-findall(Y,(fallas(_,Y)),L).

totalestudiantes(Z):-listaestudiantes(L1), longitud(L1,S),Z is S.
estudiantespierdenporfallas(Z):-listaperdidasporfallas(L1), longitud(L1,S),Z is S.
estudiantesposibleoportunidad(Z):-listaposibleoportunidad(L1), longitud(L1,S),Z is S.
estudiantesasistenciasuficiente(Z):-listaasistenciasuficiente(L1), longitud(L1,S),Z is S.
estudiantesasistenciacompleta(Z):-listaasistenciacompleta(L1), longitud(L1,S),Z is S.
promediofallas(Z):-listafallas(L1),suma(L1,S),longitud(L1,T),Z is floor(S/T). 
promediocompleta(Z):- estudiantesasistenciacompleta(Z1), totalestudiantes(Z2),Z is Z2/Z1.

%Calculo Notas
pasoElTrabajo(X, Y, Z):- (calificacionEstudiante(X, Y), (Y =< 2.5 -> Z = 'Perdio';
                            Y =< 3.0, Y > 2.5 -> Z = 'Profe Ayudeme';
                            Y =< 4.9, Y > 3.0 -> Z = 'Paso';
                            Y == 5.0 -> Z = 'Felicitaciones 5/5'
                            )
                        ).


perdidos(E):- pasoElTrabajo(E, _, R), R == 'Perdio'.
necesitados(E):- pasoElTrabajo(E, _, R), R == 'Profe Ayudeme'.
pasaron(E):- pasoElTrabajo(E, _, R), R == 'Paso'.
asperos(E):- pasoElTrabajo(E, _, R), R == 'Felicitaciones 5/5'.
notasperdidos(N):- pasoElTrabajo(_, N, R), R == 'Perdio'.
notasnecesitados(N):- pasoElTrabajo(_, N, R), R == 'Profe Ayudeme'.
notaspasaron(N):- pasoElTrabajo(_, N, R), R == 'Paso'.
notasasperos(N):- pasoElTrabajo(_, N, R), R == 'Felicitaciones 5/5'.
porcentajePerdidos(X,Y,Z):- Z is (X/Y)*100.


%Calculo Definitiva
pasaPorNotaYAsistencia(X):- ((pasoElTrabajo(X,_,'Paso'),(asistenciacompleta(X);asistenciasuficiente(X);
                            daroportunidad(X)));(pasoElTrabajo(X,_,'Profe Ayudeme'),(asistenciacompleta(X);
                            asistenciasuficiente(X)));
                            (pasoElTrabajo(X,_,'Felicitaciones 5/5'),(asistenciacompleta(X);
                            asistenciasuficiente(X);daroportunidad(X)))).
pierdePorNotaOAsistencia(X):- (
                                            (pasoElTrabajo(X,_,'Perdio'),(asistenciacompleta(X);
                                            asistenciasuficiente(X);daroportunidad(X);perdidafallas(X)));
                                            (pasoElTrabajo(X,_,'Profe Ayudeme'),
                                            (perdidafallas(X);daroportunidad(X)));
                                            ((pasoElTrabajo(X,_,'Paso');
                                            pasoElTrabajo(X,_,'Felicitaciones 5/5')),
                                            (perdidafallas(X)))
                                         ).
                            
listaAprobados(L):- findall(X,pasaPorNotaYAsistencia(X),L).
totalAprobados(T):- listaAprobados(L1), longitud(L1,S), T is S.
listaReprobados(L):- findall(X,pierdePorNotaOAsistencia(X),L).
totalReprobados(T):- listaReprobados(L1), longitud(L1,S), T is S.
pertenece(X,[X|_]).
pertenece(X,[_|L], R):- pertenece(X,L), R is X.
definitivaXs(X):- listaperdidasporfallas(L1), pertenece(X, L1, R), X is R.