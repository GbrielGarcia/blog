import 'package:flutter/material.dart';
import 'package:web_responsive/utils/styles/styles.dart';
import 'package:web_responsive/utils/utils.dart';

Widget inkWellText(
  String text,
  Function() onTap, {
  Color? color,
  dynamic fontSize,
}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyleUtils.textGlobal(
          color: color ?? ColorsStyleUtils.textOrange,
          fontSize: fontSize ?? ConstsUtils.sSmall,
          fontWeight: FontWeight.bold),
    ),
  );
}
