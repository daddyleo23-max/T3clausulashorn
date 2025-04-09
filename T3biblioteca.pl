% HECHOS
% Libros: título, autor, género, año, código.
libro(cien_anos_de_soledad, gabriel_garcia_marquez, realismo_magico, 1967, 101).
libro(el_resplandor, stephen_king, terror, 1977, 102).
libro(1984, george_orwell, distopia, 1949, 103).
libro(orgullo_y_prejuicio, jane_austen, romance, 1813, 104).

% Usuarios: nombre, ID.
usuario(maria, 1).
usuario(carlos, 2).
usuario(luisa, 3).

% Préstamos: código_libro, ID_usuario, fecha (AAAAMMDD).
prestamo(101, 1, 20231015).  % María tiene "Cien años de soledad".
prestamo(103, 2, 20231120).  % Carlos tiene "1984".

% REGLAS
% 1. Buscar libros por género.
libros_por_genero(Genero, Titulo) :-
    libro(Titulo, _, Genero, _, _).

% 2. Buscar libros de un autor.
libros_de_autor(Autor, Titulo) :-
    libro(Titulo, Autor, _, _, _).

% 3. Libros prestados a un usuario.
libros_prestados_a_usuario(UsuarioID, Titulo) :-
    prestamo(CodigoLibro, UsuarioID, _),
    libro(Titulo, _, _, _, CodigoLibro).

% 4. Libros disponibles (no prestados).
libro_disponible(Titulo) :-
    libro(Titulo, _, _, _, Codigo),
    \+ prestamo(Codigo, _, _).

% 5. Libros publicados en un rango de años.
libros_entre_anios(AnioInicio, AnioFin, Titulo) :-
    libro(Titulo, _, _, Anio, _),
    Anio >= AnioInicio,
    Anio =< AnioFin.
