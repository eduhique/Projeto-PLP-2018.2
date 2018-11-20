:- use_module(keysGenarator).
:- use_module(rsaAlgorithm).
:- use_module(isPrime).
:- initialization menu.

input(Number):-
  read_line_to_codes(user_input, Codes),
  string_to_atom(Codes, Atom),
  atom_number(Atom, Number).

menu :-
  set_prolog_stack(global, limit(100 000 000 000)),
  writeln("\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem"),
  writeln("(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair"),
  write("\nOpção => "), input(OP),
  executar(OP).

executar(OP) :-
  OP == 1, gerarChaves, menu;
	OP == 2, criptografar, menu;
  OP == 3, descriptografar, menu;
  OP == 4, rsa, menu;
  OP == 5, true, halt(0);
  writeln("\nOpção Inválida!"), menu.

gerarChaves :-
  write("\n(1)Inserir primos\n(2)Gerar automaticamente\n\nOpção => "), input(OP2) -> (
	OP2 == 1 -> (
    write("\nInsira os primos a seguir: \n\nInsira o primo 1: "), input(PRIMO1),
  	write("Insira o primo 2: "), input(PRIMO2),
    (isPrime(PRIMO1),isPrime(PRIMO2),PRIMO1>=5,PRIMO2>=5) -> (
    geraKeys(PRIMO1,PRIMO2));
    writeln("\nValores inseridos invalidos"));
	OP2 == 2 -> (
    getPrime(PRIMO1), getPrime(PRIMO2),
    geraKeys(PRIMO1,PRIMO2))).

criptografar:- write("\nInsira a mensagem: "), read_line_to_string(user_input, MENSAGEM),
	write("\nInsira a Chave pública: \n  n: "), input(N),
	write("  e: "), input(E), nl, writeln("Criptografando..."),nl,
  ultraCript(MENSAGEM, RETURN,_, E, N),
  write("Mensagem Criptografada: "), writeln(RETURN).


descriptografar :- write("\nInsira a mensagem criptografada: "),
  read_line_to_string(user_input, MENSAGEM),
  stringToList(MENSAGEM, LIST),
  strArToIntAr(LIST, CODIFICADA),
	write("\nInsira a Chave Privada:  \n  d: "), input(D), nl,
	write("  n: "), input(N),
  writeln("Descriptografando..."),
  decryptToStr(CODIFICADA, D, N, RETURN),nl,
  write("Mensagem Decriptografada: "), writeln(RETURN).

rsa :-
  write("\n\nInsira a mensagem: "),
  read_line_to_string(user_input, MENSAGEM), nl,
  write("\nInsira a Chaves:  \n  d: "),	input(D), nl,
  write("  n: "), input(N), nl, write("  e: "), input(E), nl,
  ultraCript(MENSAGEM, RETURN_ENCRIP,CODIFICADA, E, N),
  write("Mensagem Criptografada: "), writeln(RETURN_ENCRIP),nl,
  writeln("Descriptografando..."),
  decryptToStr(CODIFICADA, D, N, RETURN_DECRIP),
  writeln("Mensagem Decriptografada (ou não): "), writeln(RETURN_DECRIP).
