import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';

class RegexUtils {
  // Expresión regular para validar correos electrónicos
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
  );

  static final RegExp numberR = RegExp(r'[0-9]');

  // Método para validar el formato del correo electrónico
  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  // Método para mostrar un mensaje de error si el correo no es válido
  static void showEmailValidationSnackBar(BuildContext context) {
    SnackBarWidget.showErrorSnackBar(
        context, 'Ingrese un correo electrónico válido.');
  }

  // Método para reemplazar los guiones por espacios
  static String replaceDashesWithSpaces(String input) {
    return input.replaceAll(RegExp(r'-'), ' '); // Reemplaza cada '-' por un espacio
  }
}
