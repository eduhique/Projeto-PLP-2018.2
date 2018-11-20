% :- initialization main.

stringToAscii(S, L):-
    atom_codes(L, S).

asciiToString(L, S):-
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
