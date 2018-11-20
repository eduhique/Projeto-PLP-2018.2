:- module(
    'rsaAlgorithm',
    [stringToAscii/2,
    asciiToString/2,
    listToString/2,
    encrypt/4,
    decrypt/4]
).

stringToAscii(S, L):-
    atom_codes(S, L).

asciiToString(L, S):-
    format("~s~n", [L]).

listToString(L, S):-
    atomic_list_concat(L, '', Atom),
    atom_string(Atom, S).

encrypt([], [], _, _).
encrypt([H|T], [X|Result_list], E, N):-
    X is mod((H **  E), N),
    encrypt(T, Result_list, E, N).

decrypt([], [], _, _).
decrypt([H|T], [X|Result_list], D, N):-
    X is mod((H ** D), N),
    decrypt(T, Result_list, D, N).
