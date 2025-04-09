% HECHOS (los que ya tenías)
es_objeto(martillo).
es_objeto(silla).
es_objeto(mesa).
es_objeto(destornillador).
es_objeto(cuchara).

material(martillo, metal).
material(destornillador, metal).
material(cuchara, plastico).
material(silla, madera).
material(mesa, madera).

tipo(martillo, herramienta).
tipo(destornillador, herramienta).
tipo(cuchara, utensilio).
tipo(silla, mueble).
tipo(mesa, mueble).

% 1. Objetos metálicos
es_metalico(X) :- material(X, metal).

% 2. Objetos de madera
es_de_madera(X) :- material(X, madera).

% 3. Herramientas
es_herramienta(X) :- tipo(X, herramienta).

% 4. Utensilios
es_utensilio(X) :- tipo(X, utensilio).

% 5. Objetos reciclables (no metálicos)
es_reciclable(X) :- \+ es_metalico(X).