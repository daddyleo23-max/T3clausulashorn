
% ----------------------------
% HECHOS 
% ----------------------------

% Pacientes y sus síntomas
tiene_sintoma(ana, fiebre).
tiene_sintoma(ana, tos).
tiene_sintoma(luis, cansancio).
tiene_sintoma(luis, dolor_cabeza).
tiene_sintoma(marta, fiebre).
tiene_sintoma(marta, vomito).
tiene_sintoma(pedro, dolor_estomago).
tiene_sintoma(pedro, nauseas).

% Relación entre síntomas y enfermedades
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).
sintoma_de(dolor_cabeza, migraña).
sintoma_de(vomito, infeccion).
sintoma_de(nauseas, infeccion).
sintoma_de(dolor_estomago, gastritis).

% Medicamentos que eliminan síntomas
elimina(aspirina, fiebre).
elimina(jarabe, tos).
elimina(vitaminas, cansancio).
elimina(analgesico, dolor_cabeza).
elimina(antiacido, dolor_estomago).
elimina(suero, vomito).
elimina(antibiotico, infeccion).

% ----------------------------
% REGLAS
% ----------------------------

% 1. Diagnóstico: Paciente tiene enfermedad si presenta un síntoma asociado
esta_enfermo(Paciente, Enfermedad) :-
    tiene_sintoma(Paciente, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% 2. Medicamento alivia enfermedad si trata uno de sus síntomas
alivia(Medicamento, Enfermedad) :-
    sintoma_de(Sintoma, Enfermedad),
    elimina(Medicamento, Sintoma).

% 3. Receta médica: Medicamento para enfermedad del paciente
recetar(Paciente, Medicamento) :-
    esta_enfermo(Paciente, Enfermedad),
    alivia(Medicamento, Enfermedad).

% 4. Síntoma severo: Aparece en más de un paciente
sintoma_severo(Sintoma) :-
    tiene_sintoma(Paciente1, Sintoma),
    tiene_sintoma(Paciente2, Sintoma),
    Paciente1 \= Paciente2.

% 5. Paciente con múltiples síntomas
tiene_multiples_sintomas(Paciente) :-
    tiene_sintoma(Paciente, Sintoma1),
    tiene_sintoma(Paciente, Sintoma2),
    Sintoma1 \= Sintoma2.

% 6. Enfermedad compleja: Tiene más de un síntoma
enfermedad_compleja(Enfermedad) :-
    sintoma_de(Sintoma1, Enfermedad),
    sintoma_de(Sintoma2, Enfermedad),
    Sintoma1 \= Sintoma2.

% 7. Medicamento útil: Elimina al menos un síntoma
medicamento_util(Medicamento) :-
    elimina(Medicamento, _).

% 8. Síntoma sin diagnóstico conocido
sintoma_sin_diagnostico(Paciente, Sintoma) :-
    tiene_sintoma(Paciente, Sintoma),
    \+ sintoma_de(Sintoma, _).

% 9. Medicamento multiusos: Alivia más de una enfermedad
medicamento_multiusos(Medicamento) :-
    alivia(Medicamento, Enfermedad1),
    alivia(Medicamento, Enfermedad2),
    Enfermedad1 \= Enfermedad2.

% 10. Necesidad de suero: Paciente con vómito
necesita_suero(Paciente) :-
    tiene_sintoma(Paciente, vomito).

