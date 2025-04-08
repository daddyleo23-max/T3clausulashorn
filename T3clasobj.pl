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

% REGLAS NUEVAS (Cláusulas de Horn)
% 1. Definir objetos metálicos
es_metalico(X) :- material(X, metal).

% 2. Definir objetos de madera
es_de_madera(X) :- material(X, madera).

% 3. Definir herramientas (ya existe en tipo/2, pero por claridad)
es_herramienta(X) :- tipo(X, herramienta).

% 4. Objetos utilizables (herramientas o utensilios)
es_utilizable(X) :- tipo(X, herramienta).
es_utilizable(X) :- tipo(X, utensilio).