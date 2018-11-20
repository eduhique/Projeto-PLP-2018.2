:- initialization main.

stringToAscii(S, L):-
    atom_codes(S, L).

asciiToString(L, S):-
    atom_codes(S, L).

encrypt([], [], E, N).
encrypt([H|T], [X|Result_list], E, N):- 
    X is mod((H ** E), N),
    encrypt(T, Result_list, E, N).

decrypt([], [], D, N).
decrypt([H|T], [X|Result_list], D, N):- 
    X is mod((H ** D), N),
    decrypt(T, Result_list, D, N).

main:-
    set_prolog_stack(global, limit(100 000 000 000)),    
    write("Texto: "),
    read_line_to_string(user_input, STRING),
    stringToAscii(STRING, LISTA),
    
    encrypt(LISTA, CODIFICADA, 259883, 48087047),
    write('codificada: '), write(CODIFICADA), write('\n'),
    
    decrypt(CODIFICADA, DECODIFICADA, 20404259, 48087047),
    asciiToString(DECODIFICADA, RESULTADO_STRING),
    write('decodificada: '), write(RESULTADO_STRING).