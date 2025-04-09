% 1-5. Películas clásicas
película(el_padre, [género(drama), director(francis_ford_coppola), rating(9.2), año(1972)]).
película(inception, [género(ciencia_ficción), director(christopher_nolan), rating(8.8), año(2010)]).
película(parasitos, [género(thriller), director(bong_joon_ho), rating(8.6), año(2019)]).
película(toy_story, [género(animación), director(john_lasseter), rating(8.3), año(1995)]).
película(pulp_fiction, [género(crimen), director(quentin_tarantino), rating(8.9), año(1994)]).

% 6-10. Películas adicionales
película(el_viaje_de_chihiro, [género(animación), director(hayao_miyazaki), rating(8.6), año(2001)]).
película(interstellar, [género(ciencia_ficción), director(christopher_nolan), rating(8.6), año(2014)]).
película(el_laberinto_del_fauno, [género(fantasía), director(guillermo_del_toro), rating(8.2), año(2006)]).
película(whiplash, [género(drama), director(damien_chazelle), rating(8.5), año(2014)]).
película(mad_max, [género(acción), director(george_miller), rating(8.1), año(2015)]).

% 1-3. Búsquedas básicas (ya existían)
recomendar_por_género(Género, Película) :-
    película(Película, Atributos),
    member(género(Género), Atributos).

recomendar_por_rating(Rating_Mínimo, Película) :-
    película(Película, Atributos),
    member(rating(Rating), Atributos),
    Rating >= Rating_Mínimo.

películas_de_director(Director, Película) :-
    película(Película, Atributos),
    member(director(Director), Atributos).

% 4. Películas de un año específico
películas_de_año(Año, Película) :-
    película(Película, Atributos),
    member(año(Año), Atributos).

% 5. Películas con rating entre dos valores
películas_entre_ratings(Mín, Máx, Película) :-
    película(Película, Atributos),
    member(rating(R), Atributos),
    R >= Mín, R =< Máx.

% 6. Directores con películas mejor valoradas (rating > 8.5)
director_prestigioso(Director) :-
    película(_, Atributos),
    member(director(Director), Atributos),
    member(rating(R), Atributos),
    R > 8.5.

% 7. Películas recientes (a partir de 2010)
película_reciente(Película) :-
    película(Película, Atributos),
    member(año(Año), Atributos),
    Año >= 2010.

% 8. Géneros disponibles (sin repetir)
género_disponible(Género) :-
    setof(G, P^A^(película(P, A), member(género(G), A)), Géneros),
    member(Género, Géneros).

% 9. Películas con múltiples criterios (género + rating)
recomendación_compleja(Género, Rating_Mínimo, Película) :-
    recomendar_por_género(Género, Película),
    recomendar_por_rating(Rating_Mínimo, Película).

% 10. Top 3 películas por rating
top_3_películas([P1, P2, P3]) :-
    findall(R-P, (película(P, A), member(rating(R), A)), Lista),
    sort(Lista, Sorted),
    reverse(Sorted, [_-P1, _-P2, _-P3 | _]).