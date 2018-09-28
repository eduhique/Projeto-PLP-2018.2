# Criptografia RSA
Sistema de criptografia RSA, realizando criptografia de mensagens recebidas por usuário utilizando manipulações de tabela ASCII, teste de primalidade, modular inverso, dentre outras técnicas de algoritmo.

## Como rodar

Para rodar basta:

```
make run
```

Após isso você verá um menu. Para mais dúvidas veja o help `make help`.

## Uso
- No menu se terá 5 opções. Iniciando o sistema pela primeira vez é **necessário** gerar as chaves, para se poder realizar os demais processos, digitando **1**.
- Para criptografar uma mensagem, basta digitar **2**, ele irá usar as últimas chaves geradas, imprimindo após a mensagem criptografada no formato parecido com : `12321 42342 ...`
- Para descriptograr uma mensagem criptografada usando as chaves do sistema, basta digitar **3**, insira a mensagem criptograda seguindo o formato parecido com : `12321 42342 ...` e ele irá descriptografar com a chave atual.
- Para ver os dois processos rodando simultânteo, digite **4**
- Para sair **5**

## Como foi feito

- Para geração de números primos, foram escolhidos números relativamente grandes, depois é usado o primality test para se verificar se os mesmos são primos.
- Para geração de chaves, é feito: `chave_publica(e, n)` e `chave_privada(d, n)`. Onde `e` é um número calculado a partir dos números primos escolhidos( `p` e `q`), sendo `e` menor que (p - 1) * (q - 1), e que seu maior divisao comum com esse valor seja 1. Para a escolha do `d` é feito um cálculo de modular inverso a partir do valor do `e` sendo aplicada essa função. Já o `n` é feito o produto dos números primos(`p * q`)
- Para realizar efetivamente a criptografia, a mensagem é transformada para códigos da tabela ASCII para se pdoer realizar operações matemáticas. Dividindo cada letra como um bloco da mensagem, chamamos cada bloco um por um, e realizamos o seguinte cálculo:

```
mensagem_criptografada = (Mˆe) mod (n)
```

- Para realizar a criptografia, é pego a mesangem_criptograda, e separada por blocos é feito o cálculo:

```
mensagem_descriptografada = (Mˆd) mod (n)
```

Após isso é transformado novamente para tabela ASCII.

## Grupo:
- Thayanne Luiza
- Eduardo Henrique
- João Pedro
- Rafael Dantas
- Matheus Áraujo