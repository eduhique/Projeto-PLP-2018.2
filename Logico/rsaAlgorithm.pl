:- initialization main.

stringToAscii(S, L):-
    atom_codes(S, L).

asciiToString(L, S):-
    atom_codes(S, L).

encrypt([], []).
encrypt([H|T], [X|Result_list]):- 
    X is mod((H **  259883), 48087047),
    encrypt(T, Result_list).

decrypt([], []).
decrypt([H|T], [X|Result_list]):- 
    X is mod((H ** 20404259), 48087047),
    decrypt(T, Result_list).

main:-
    set_prolog_stack(global, limit(100 000 000 000)),    
    write("Texto: "),
    read_line_to_string(user_input, STRING),
    stringToAscii(STRING, LISTA),
    
    encrypt(LISTA, CODIFICADA),
    write('codificada: '), write(CODIFICADA), write('\n'),
    
    decrypt(CODIFICADA, DECODIFICADA),
    asciiToString(DECODIFICADA, RESULTADO_STRING),
    write('decodificada: '), write(RESULTADO_STRING).