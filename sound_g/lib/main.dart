import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verificación de Peso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeightFormPage(),
    );
  }
}

class WeightFormPage extends StatefulWidget {
  @override
  _WeightFormPageState createState() => _WeightFormPageState();
}

class _WeightFormPageState extends State<WeightFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isOverWeight = false;
  String _message = '';
  String _messageImg = 'assets/img/gordas.jpg';

  Future<void> _checkWeight() async {
    if (_formKey.currentState!.validate()) {
      double weight = double.parse(_controller.text);
      if (weight > 79) {
        setState(() {
          _isOverWeight = true;
          _message = 'Prohibido Gordas'.toUpperCase();
        });
        await _playSound();
      } else {
        setState(() {
          _isOverWeight = false;
          _message = 'Peso normal';
        });
      }
    }
  }

  Future<void> _playSound() async {
    // Reemplaza la URL con la dirección de tu archivo de sonido
    await _audioPlayer.play(
      UrlSource('assets/sound/video.wav'), // URL de tu archivo de sonido
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose(); // Asegúrate de liberar los recursos del reproductor
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        title: Text('Verificación de Peso en KG'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          height: 800,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 600.0,
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Ingrese su peso en kg'.toUpperCase(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese un valor';
                        }
                        final weight = double.tryParse(value);
                        if (weight == null || weight <= 0) {
                          return 'Ingrese un valor válido';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: _checkWeight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10)),
                    width: 600.0,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Verificar'.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  _message,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _isOverWeight ? Colors.red : Colors.green,
                  ),
                ),
                // Solo mostrar la imagen si el peso es mayor a 80 kg
                if (_isOverWeight)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      _messageImg,
                      height: 550.0,
                    ),
                  ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
