import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  List emails = [
    "jonnybanach@gmail.com",
    "leticiaisis50@gmail.com",
    "romi.meister2015@gmail.com",
    "vilmabanach@gmail.com",
    "cindymbanach@gmail.com",
    "leilamaisaschreiner@gmail.com",
  ];

  List livro1 = [
    "A biblioteca da meia noite",
    " O príncipe Cruel - Holly Black",
    "Oceano entre nós (Tahereh Máfi)",
    "Esplêndida",
    "Fahrenheit 451",
    "As sete leis espirituais do sucesso",
  ];

  List livro2 = [
    "A Lista de Brett",
    "Um milhão de finais felizes - Vitor Martins",
    "Nosso lugar entre cometas (Fernanda Nia)",
    "Romance com o duque",
    "Locke & Key: Bem-vindo a Lovecraft",
    "A coragem de ser Imperfeito",
  ];

  List livro3 = [
    "Malibu Renasce",
    "E não sobrou nenhum - Agatha Christie",
    "Coraline (Neil Gaiman)",
    "A coragem de ser imperfeito",
    "Verity - Colleen Hoover",
    "Nunca desista de seus sonhos",
  ];

  String username = 'connectwiishop@gmail.com';
  String password = 'Jon1123581321*';

  final smtpServer = gmail(username, password);
  // Use the SmtpServer class to configure an SMTP server:
  // final smtpServer = SmtpServer('smtp.domain.com');
  // See the named arguments of SmtpServer for further configuration
  // options.

  int i = 0;
  for (String email in emails) {
    Random random = Random();
    int bookIndex = random.nextInt(livro1.length);

    String books = "Livro 1: ${livro1[bookIndex]}<br>";
    books += "Livro 2: ${livro2[bookIndex]}<br>";
    books += "Livro 3: ${livro3[bookIndex]}<br>";

    livro1.removeAt(bookIndex);
    livro2.removeAt(bookIndex);
    livro3.removeAt(bookIndex);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Sorteio - Livro Secreto')
      ..recipients.add(email)
      ..subject = 'Sorteio - Livro Secreto - Tentativa 1'
      ..html =
          "<h1>Sorteio - Livro Secreto</h1>\n<p>Olá! Segue abaixo as opções de livros que seu amigo secreto escolheu: </p><br>$books"
              "<br><b>Por favor, verifique se você não recebeu a sua própria lista de livros.</b>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. $e');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    i++;
  }

  runApp(MaterialApp(
    title: "Sending emails",
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Sending emails'),
      ),
      body: Container(),
    ),
  ));
}

/*
class Person {
  late String nome;
  void configuraNome(String texto) {
    nome = texto;
  }
}

class Usuario {
  String? _nome;
  int totalCaracteres() {
    // Variável auxiliar para promoção do tipo
    String? nome = _nome;
    if (nome == null) {
      return 0;
    }
    return nome.length;
  }
}

int soma({required int primeiro, int segundo = 0}) {
  return primeiro + segundo;
}

int totalCaracteres(String? texto) {
  if (texto == null) {
    throw "texto não pode ser nulo";
    // return 0;
  }
  return texto.length;
}

int? numero = 10;
String? nome = "Jamilton";

void main() {
  print(totalCaracteres("jonny"));

  String? texto;

  if (DateTime.now().hour < 12) {
    texto = "verdadeiro";
  } else {
    texto = "falso";
  }

  print("Tamanho: ${texto.length}");

  int resultSoma = soma(primeiro: 1, segundo: 2);

  // Variáveis nulas
  String? complemento;
  double? preco;

  /// operador (!) -> null assertion operator
  // int? numero = 10;
  int resultado = numero!;
  print("Resultado é $resultado");

  String result = nome ?? "";
  print("total caracteres: ${result.length}");

  // runApp(const MaterialApp(
  //   title: "Null Safety",
  //   home: Home(),
  // ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class Funcionario {
  // tardio, tarde
  late double salario;

  calcular() {
    salario = 100;
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Null Safety"),
      ),
    );
  }
}

 */
