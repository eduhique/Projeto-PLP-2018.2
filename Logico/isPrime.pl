
isPrime(2) :-
    !.
isPrime(3) :-
    !.
isPrime(X) :-
    X > 3,
    X mod 2 =\= 0,
    N_max is ceiling(sqrt(X)),
    isPrime2(X,3,N_max).

isPrime2(X,N,N_max) :-
    (  N > N_max
    -> true
    ;  0 =\= X mod N,
       M is N + 2,
       isPrime2(X,M,N_max)
    ).

