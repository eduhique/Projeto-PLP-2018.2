help:
	@echo "====== Bem vindo ao sistema de criptografia RSA. ======"
	@echo "Para rodar qualquer comando: make <command> <arguments..>'."
	@echo "    "
	@echo "    help - imprime essa mensagem de ajuda"
	@echo "    "
	@echo "    run"
	@echo "        Roda o projeto apresentando o menu."
	@echo "    "
	@echo "    compile"
	@echo "        Compila os arquivos"
	@echo "    "
	@echo "    install"
	@echo "        Instala a biblioteca random para haskell"
	@echo "    "

install: 
	cabal update && cabal install random
.PHONY: install

compile:
	ghc menu.hs -o rsa
.PHONY: compile

run: compile
	./rsa
.PHONY: compile