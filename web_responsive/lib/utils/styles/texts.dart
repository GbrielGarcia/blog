import 'package:flutter/material.dart';
import 'package:web_responsive/utils/styles/styles.dart';
import 'package:web_responsive/utils/utils.dart';

class TextStyleUtils {
  static TextStyle textGlobal({
    fontSize,
    color,
    fontWeight,
    decoration,
    decorationThickness,
    decorationColor,
  }) {
    return TextStyle(
      fontSize: fontSize ?? ConstsUtils.sSmall,
      color: color ?? ColorsStyleUtils.textBlack,
      fontWeight: fontWeight ?? FontWeight.w100,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness ?? 0.0,
      decorationColor: decorationColor ?? Colors.transparent,
    );
  }
}
