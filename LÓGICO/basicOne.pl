basicOne() :-
    random(10000000, 1000000000, A),
    test(A).

test(A) :-
    (   isPrime2(A) ->
        writeln(A),
        true
    ;   repeat,
        random(10000000, 1000000000, B),
        test(B)
    ).

isPrime2(2) :-
    !.
isPrime2(3) :-
    !.
isPrime2(X) :-
    X > 3,
    X mod 2 =\= 0,
    N_max is ceiling(sqrt(X)),
    isPrime2_(X,3,N_max).

isPrime2_(X,N,N_max) :-
    (  N > N_max
    -> true
    ;  0 =\= X mod N,
       M is N + 2,
       isPrime2_(X,M,N_max)
    ).
