:- module(
  'rsaAlgorithm',
  [stringToAscii/2,
  asciiToString/2,
  listToString/2,
  stringToList/2,
  strArToIntAr/2,
  encrypt/4,
  decrypt/4,
  decryptToStr/4,
  ultraCript/5]
).

stringToAscii(S, L):-
  atom_codes(L, S).

asciiToString(S, L):-
  atom_codes(L, S).

listToString(L, S):-
  atomic_list_concat(L, ' ', Atom),
  atom_string(Atom, S).

stringToList(S, L):-
  split_string(S, " ", "", L).

strArToIntAr([], []).
strArToIntAr([H|T], [X|XS]):-
  atom_number(H, NUM),
  X is NUM,
  strArToIntAr(T, XS).

ultraCript(MENS,RETURN,COD,E,N) :-
  stringToAscii(LIST, MENS),
  encrypt(LIST, COD, E, N),
  listToString(COD, RETURN).

decryptToStr(COD, D, N, RETURN):-
  decrypt(COD, DEC, D, N),
  asciiToString(DEC, RETURN).

encrypt([], [], _, _).
encrypt([H|T], [X|Result_list], E, N):-
  X is mod((H **  E), N),
  encrypt(T, Result_list, E, N).

decrypt([], [], _, _).
decrypt([H|T], [X|Result_list], D, N):-
  X is mod((H ** D), N),
  decrypt(T, Result_list, D, N).
