import 'package:flutter/material.dart';

import '../utils/styles/styles.dart';
import '../utils/utils.dart';

Widget inkWellContainer(
  BuildContext context,
  VoidCallback onTap,
  String text, {
  Color? color,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: context.screenWidth,
      height: ConstsUtils.lSmall,
      decoration: BoxDecoration(
        color: color ?? ColorsStyleUtils.backgroundBlack,
        borderRadius: BorderRadius.circular(ConstsUtils.sSmall),
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: TextStyleUtils.textGlobal(
              color: ColorsStyleUtils.textWhite,
              fontSize: ConstsUtils.sSmall,
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
