import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerA,
              decoration: InputDecoration(labelText: 'Numero A'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controllerB,
              decoration: InputDecoration(labelText: 'Numero B'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int a = int.parse(_controllerA.text);
                    int b = int.parse(_controllerB.text);
                    context.read<CalculatorProvider>().add(a, b);
                  },
                  child: Text('Sumar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int a = int.parse(_controllerA.text);
                    int b = int.parse(_controllerB.text);
                    context.read<CalculatorProvider>().subtract(a, b);
                  },
                  child: Text('Restar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Resultado: ${context.watch<CalculatorProvider>().result}'),
          ],
        ),
      ),
    );
  }
}