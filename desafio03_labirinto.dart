// Desafio 3 - Jogo do Labirinto
// o jogador e o @ e precisa chegar na saida F
// # = parede

import 'dart:io';

void main() {
  List<String> mapa = [
    '###############',
    '#@    #       #',
    '# ### # ##### #',
    '#   #   #     #',
    '### ##### # ###',
    '#     #   #   #',
    '# ### # ##### #',
    '# #   #     # #',
    '# # ####### # #',
    '# #       #   F',
    '###############',
  ];

  // transforma cada linha numa lista de caracteres pra poder mudar a posicao
  List<List<String>> labirinto = [];
  for (int i = 0; i < mapa.length; i++) {
    labirinto.add(mapa[i].split(''));
  }

  // posicao inicial do jogador
  int linha = 1;
  int coluna = 1;
  int passos = 0;

  print('=== JOGO DO LABIRINTO ===');
  print('W = cima, S = baixo, A = esquerda, D = direita, Q = sair');

  while (true) {
    // mostra o labirinto
    print('');
    for (int i = 0; i < labirinto.length; i++) {
      print(labirinto[i].join());
    }
    print('Passos: $passos');
    print('Para onde quer ir?');
    String tecla = stdin.readLineSync()!.trim().toLowerCase();

    int novaLinha = linha;
    int novaColuna = coluna;

    if (tecla == 'w') {
      novaLinha--;
    } else if (tecla == 's') {
      novaLinha++;
    } else if (tecla == 'a') {
      novaColuna--;
    } else if (tecla == 'd') {
      novaColuna++;
    } else if (tecla == 'q') {
      print('Voce desistiu do jogo.');
      break;
    } else {
      print('Tecla invalida!');
      continue;
    }

    // se for parede nao deixa andar
    if (labirinto[novaLinha][novaColuna] == '#') {
      print('Tem uma parede ai!');
      continue;
    }

    // chegou na saida
    if (labirinto[novaLinha][novaColuna] == 'F') {
      passos++;
      print('Parabens! Voce encontrou a saida em $passos passos!');
      break;
    }

    // tira o jogador do lugar antigo e coloca no novo
    labirinto[linha][coluna] = ' ';
    labirinto[novaLinha][novaColuna] = '@';
    linha = novaLinha;
    coluna = novaColuna;
    passos++;
  }
}