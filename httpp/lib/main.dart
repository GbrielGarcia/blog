import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Map<String, String>> fraseApi() async {
      final respuesta = await http
          .get(Uri.parse('https://frasedeldia.azurewebsites.net/api/phrase'));

      if (respuesta.statusCode == 200) {
        final jsonData = jsonDecode(respuesta.body);
        final frase = jsonData['phrase'];
        final autor = jsonData['author'];
        return {'frase': frase, 'autor': autor};
      } else {
        throw Exception('No conectado');
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Utilizando API'.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Colors.purple,
        ),
        body: FutureBuilder(
          future: fraseApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error de datos'.toUpperCase());
            } else if (snapshot.hasData) {
              final frase = snapshot.data!['frase'];
              final autor = snapshot.data!['autor'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "'$frase'",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text('$autor'),
                ],
              );
            } else {
              return Text('Sin información');
            }
          },
        ),
      ),
    );
  }
}
