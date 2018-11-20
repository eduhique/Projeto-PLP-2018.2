:- module(
    'basicOne', 
    [basicOne/1,
    isPrime2/1]
).

basicOne(Result) :-
    random(1000, 20000, A),
    test(A,Result1), Result is Result1.

test(A, Result) :-
        isPrime2(A) ->
        Result is A;
        random(1000, 20000, B),
        test(B,Result).

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
