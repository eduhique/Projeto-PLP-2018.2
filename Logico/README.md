# Paradigma lógico

Paradigma lógico do sistema de criptografia RSA

## Para rodar 

```sh
swipl menu.pl
```

## Uso

### Chaves

A criptografia faz uso de duas chaves, a pública e a privada, uma usada para criptografar, e a outra para descriptografar respectivimente.

A chave pública é composta pelos números **e** e **n** e a privada pelos **d** e **n**, são elas que são usadas no procedimento de criptografia.

### Menu
No menu se terá 5 opções. No primeiro acesso, é necessário gerar as chaves pública e privada para ser possível realizar os demais procedimentos, digite *1* para isso.

- **(1)** Gera a chave pública e privada. Tendo as opções de usar números primos random(Aconselhável) ou de receber dois primos pelo usuário.

- **(2)** Criptografa uma mensagem, ele irá usar a chave pública, para isso copie seu **e** e **n** e insira quando for pedido.

- **(3)** Descriptografa uma mensagem. Recebe a mensagem criptografada exatamente como ela é imprimida pelo método *(2)*, copie e cole sua mensagem criptograda. Ele irá usar a chave privada, para isso copie seu **d** e **n** e insira quando for pedido.

- **(4)** Realiza de maneira simultânea a criptografia e descriptografia.

- **(5)** Para sair do sistema.
