import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';

import 'styles/styles.dart';

class ConstsUtils {
  static double xxsSmall = 1.5;
  static double xxSmall = 3.0;
  static double xSmall = 5.0;
  static double sSmall = 15.0;
  static double mSmall = 30.0;
  static double lSmall = 45.0;
  static double xlSmall = 60.0;
  static double xxlSmall = 75.0;
  static double xx2lSmall = 90.0;
  static double xx3lSmall = 105.0;
  static double xx4lSmall = 120.0;
}

class ConstsBorderUtils {
  static Border? getCustomBorder(BuildContext context) {
    if (context.isMobile || context.isMobileLarge) {
      return null;
    } else {
      return Border.all(
        color: ColorsStyleUtils.backgroundBlack,
        width: ConstsUtils.xxSmall,
      );
    }
  }
}
