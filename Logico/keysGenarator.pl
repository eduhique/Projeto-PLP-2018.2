:- initialization main.

calculaN(P,Q,R):- R is P*Q.

totiente(P,Q,R):- R is (P-1)*(Q-1).

getE(Totiente,Return):- 
        random(1,1000000,Ram),
        Aux is Ram mod (Totiente + 2),
        Result is gcd(Totiente,Aux),
        Result =:= 1 -> Return is Aux;
        getE(Totiente,Return).

getD(Totiente, E, Aux, Return):-
        CalAux is (E * Aux) mod Totiente,
        CalAux =:= 1 -> Return is Aux;
        getD(Totiente, E, (Aux + 1), Return).

input(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

main:-
    write("Insira o Primo 1: "),
    input(N1),
    write("Insira o Primo 2: "),
    input(N2),
    write("  Primo 1: "), writeln(N1), write("  Primo 2: "), writeln(N2),
    calculaN(N1,N2,NN),
    write("\nChave pública: \n  n: "), writeln(NN),
    totiente(N1,N2, Tot),
    getE(Tot,EE),
    write("  e: "),writeln(EE),
    getD(Tot,EE,0,DD),
    nl,
    write("\nChave Privada: \n  d: "), writeln(DD),
    nl,nl.