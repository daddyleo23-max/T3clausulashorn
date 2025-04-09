% 1-5. Animales y relaciones básicas
es_animal(gato).
es_animal(raton).
es_animal(serpiente).
es_animal(aguila).
es_animal(pez).

% 6-10. Relaciones de alimentación
come(gato, raton).
come(raton, queso).
come(serpiente, raton).
come(aguila, serpiente).
come(pez, algas).

% 1. Relación directa
come_cadena(X, Y) :- come(X, Y).

% 2. Relación indirecta (recursiva)
come_cadena(X, Y) :- come(X, Z), come_cadena(Z, Y).