import 'package:flutter/material.dart';
import 'package:web_responsive/utils/styles/colors.dart';

import 'utils.dart';

class SnackBarWidget {
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyleUtils.textOrange,
        content: Text(message.toUpperCase(),
          style: TextStyle(
          color: ColorsStyleUtils.backgroundWhite,
          fontWeight: FontWeight.bold,
          fontSize: ConstsUtils.sSmall,
        )),
      ),
    );
  }
}
