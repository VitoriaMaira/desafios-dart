// Desafio 1 - Jogo da Forca
// o jogador tenta adivinhar a palavra uma letra por vez
// se errar 6 vezes o boneco fica completo e ele perde

import 'dart:io';
import 'dart:math';

// desenha a forca de acordo com a quantidade de erros
void desenharForca(int erros) {
  String cabeca = ' ';
  String tronco = ' ';
  String bracoEsq = ' ';
  String bracoDir = ' ';
  String pernaEsq = ' ';
  String pernaDir = ' ';

  if (erros >= 1) cabeca = 'O';
  if (erros >= 2) tronco = '|';
  if (erros >= 3) bracoEsq = '/';
  if (erros >= 4) bracoDir = '\\';
  if (erros >= 5) pernaEsq = '/';
  if (erros >= 6) pernaDir = '\\';

  print('  +---+');
  print('  |   |');
  print('  |   $cabeca');
  print('  |  $bracoEsq$tronco$bracoDir');
  print('  |  $pernaEsq $pernaDir');
  print('  |');
  print('=====');
}

void main() {
  List<String> palavras = [
    'banana',
    'computador',
    'escola',
    'girafa',
    'janela',
    'programa',
    'teclado',
    'cachorro'
  ];

  // sorteia uma palavra da lista
  Random random = Random();
  String palavra = palavras[random.nextInt(palavras.length)];

  List<String> letrasCertas = [];
  List<String> letrasErradas = [];
  int erros = 0;

  print('=== JOGO DA FORCA ===');

  while (erros < 6) {
    desenharForca(erros);

    // monta a palavra mostrando so as letras que ja acertou
    String palavraOculta = '';
    bool ganhou = true;
    for (int i = 0; i < palavra.length; i++) {
      if (letrasCertas.contains(palavra[i])) {
        palavraOculta = palavraOculta + palavra[i] + ' ';
      } else {
        palavraOculta = palavraOculta + '_ ';
        ganhou = false;
      }
    }

    print('Palavra: $palavraOculta');
    print('Letras erradas: ${letrasErradas.join(', ')}');

    if (ganhou) {
      print('Parabens, voce acertou a palavra!');
      return;
    }

    print('Digite uma letra:');
    String letra = stdin.readLineSync()!.trim().toLowerCase();

    if (letra.length != 1) {
      print('Digite apenas uma letra!');
      continue;
    }

    if (letrasCertas.contains(letra) || letrasErradas.contains(letra)) {
      print('Voce ja tentou essa letra!');
      continue;
    }

    if (palavra.contains(letra)) {
      print('Acertou!');
      letrasCertas.add(letra);
    } else {
      print('Errou!');
      letrasErradas.add(letra);
      erros++;
    }
  }

  desenharForca(erros);
  print('Voce perdeu! A palavra era: $palavra');
}