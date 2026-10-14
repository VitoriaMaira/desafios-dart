# Desafios Dart

Disciplina: Programacao para Dispositivos Moveis

Professora: Layse Souza

Aluna: Vitoria Maira

Repositorio com os 3 desafios de jogos feitos em Dart, todos rodando no console (terminal).

## Desafio 1 - Jogo da Forca

Arquivo: `desafio01_forca.dart`

O programa sorteia uma palavra e o jogador tem que adivinhar digitando uma letra por vez.
Se a letra existir na palavra ela aparece no lugar certo, se nao existir uma parte do boneco e desenhada.

- O jogador ganha se descobrir a palavra inteira
- O jogador perde se errar 6 vezes (cabeca, tronco, 2 bracos e 2 pernas)
- O jogo avisa se digitar mais de uma letra ou uma letra que ja foi usada

## Desafio 2 - Jogo da Velha

Arquivo: `desafio02_velha.dart`

Jogo para 2 jogadores (X e O) num tabuleiro 3x3. Cada um escolhe a linha e a coluna onde quer jogar.

- Ganha quem fizer 3 simbolos iguais na linha, coluna ou diagonal
- Se o tabuleiro encher e ninguem ganhar, da velha (empate)
- Nao deixa jogar em posicao ocupada ou fora do tabuleiro

Exemplo do tabuleiro:

```
    1   2   3
1   X | O | X
   ---+---+---
2     | O |
   ---+---+---
3     |   | X
```

## Desafio 3 - Jogo do Labirinto

Arquivo: `desafio03_labirinto.dart`

O jogador e o `@` e precisa sair do labirinto chegando no `F`. Os `#` sao as paredes.
O labirinto tem alguns caminhos sem saida, entao tem que prestar atencao.

Comandos:

| Tecla | Movimento |
|-------|-----------|
| W | cima |
| S | baixo |
| A | esquerda |
| D | direita |
| Q | sair do jogo |

No final o jogo mostra quantos passos foram dados ate a saida.

## Como rodar

Precisa ter o Dart instalado. Para ver se esta instalado:

```
dart --version
```

Depois e so entrar na pasta e rodar o desafio que quiser:

```
dart run desafio01_forca.dart
dart run desafio02_velha.dart
dart run desafio03_labirinto.dart
```

## Observacao

Os jogos usam `stdin.readLineSync()` para ler o que o jogador digita, por isso nao funcionam no DartPad.
Em compiladores online como o OneCompiler da para testar, mas tem que colocar todas as entradas de uma vez no STDIN, uma por linha.
