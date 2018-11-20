% :- initialization main.

stringToAscii(S, L):-
    atom_codes(L, S).

asciiToString(L, S):-
<<<<<<< HEAD
    format("~s~n", [L]).

listToString(L, S):-
    atomic_list_concat(L, '', Atom),
    atom_string(Atom, S).

encrypt([], []).
encrypt([H|T], [X|Result_list]):-
    X is mod((H ** 3), 391),
    encrypt(T, Result_list).

decrypt([], []).
decrypt([H|T], [X|Result_list]):-
    X is mod((H ** 235), 391),
    decrypt(T, Result_list).

% main:-
%     write("Texto: "),
%     read_line_to_string(user_input, STRING),
%     stringToAscii(STRING, LISTA),
%
%     encrypt(LISTA, CODIFICADA),
%     write('codificada: '), write(CODIFICADA), write('\n'),
%
%     decrypt(CODIFICADA, DECODIFICADA),
%     listToString(DECODIFICADA, RESULTADO_NUM),
%     asciiToString(RESULTADO_NUM, RESULTADO_STRING),
%     write('decodificada: '), write(RESULTADO_STRING).
=======
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
>>>>>>> 5e97051fef36ceffcce993e97b360b780d7bb12c
