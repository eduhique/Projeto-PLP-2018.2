calculaN(P,Q,R):- R is P*Q.

totiente(P,Q,R):- R is (P-1)*(Q-1).

getE(Totiente,Return):- 
        random(1,1000000,Ram),
        Aux is Ram mod (Totiente + 2),
        Result is gcd(Totiente,Aux),
        Result =:= 1 -> Return is Aux;
        getE(Totiente,Return).

getD(Totiente, E, Aux, Return):-
        (E * Aux) mod Totiente =:= 1 -> Return is Aux;
        Aux2 is Aux + 1,
        getD(Totiente, E, Aux2, Return).

input(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

geraKeys(P,Q):- 
        calculaN(P,Q,N),
        totiente(P,Q, Tot),
        getE(Tot,E),
        getD(Tot,E,0,D),
        nl,
        write("\nChave pública: \n  n: "), writeln(N),
        write("  e: "),writeln(E),
        write("\nChave Privada: \n  d: "), writeln(D),
        write("  Primo 1: "), writeln(P), write("  Primo 2: "), writeln(Q).