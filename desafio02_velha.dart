// Desafio 2 - Jogo da Velha
// dois jogadores, X e O, jogando num tabuleiro 3x3
// ganha quem fizer 3 iguais na linha, coluna ou diagonal

import 'dart:io';

// mostra o tabuleiro na tela
void mostrarTabuleiro(List<List<String>> tabuleiro) {
  print('');
  print('    1   2   3');
  for (int i = 0; i < 3; i++) {
    print('${i + 1}   ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]}');
    if (i < 2) {
      print('   ---+---+---');
    }
  }
  print('');
}

// verifica se o jogador fez 3 iguais
bool verificarVitoria(List<List<String>> t, String j) {
  // linhas e colunas
  for (int i = 0; i < 3; i++) {
    if (t[i][0] == j && t[i][1] == j && t[i][2] == j) {
      return true;
    }
    if (t[0][i] == j && t[1][i] == j && t[2][i] == j) {
      return true;
    }
  }

  // diagonais
  if (t[0][0] == j && t[1][1] == j && t[2][2] == j) {
    return true;
  }
  if (t[0][2] == j && t[1][1] == j && t[2][0] == j) {
    return true;
  }

  return false;
}

void main() {
  List<List<String>> tabuleiro = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' '],
  ];

  String jogador = 'X';
  int jogadas = 0;

  print('=== JOGO DA VELHA ===');

  while (true) {
    mostrarTabuleiro(tabuleiro);
    print('Vez do jogador $jogador');

    print('Digite a linha (1 a 3):');
    int? linha = int.tryParse(stdin.readLineSync()!);
    print('Digite a coluna (1 a 3):');
    int? coluna = int.tryParse(stdin.readLineSync()!);

    // confere se digitou um numero valido
    if (linha == null || coluna == null || linha < 1 || linha > 3 || coluna < 1 || coluna > 3) {
      print('Posicao invalida! Tente de novo.');
      continue;
    }

    // na lista a posicao comeca do 0
    linha = linha - 1;
    coluna = coluna - 1;

    if (tabuleiro[linha][coluna] != ' ') {
      print('Essa posicao ja esta ocupada!');
      continue;
    }

    tabuleiro[linha][coluna] = jogador;
    jogadas++;

    if (verificarVitoria(tabuleiro, jogador)) {
      mostrarTabuleiro(tabuleiro);
      print('O jogador $jogador venceu!');
      break;
    }

    // se preencheu tudo e ninguem ganhou da velha
    if (jogadas == 9) {
      mostrarTabuleiro(tabuleiro);
      print('Deu velha! Empate.');
      break;
    }

    // troca o jogador
    if (jogador == 'X') {
      jogador = 'O';
    } else {
      jogador = 'X';
    }
  }
}