import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';

Widget textPadding(Widget child, BuildContext context,
    {double? vertical, horizontal}) {
  return Padding(
    padding: context.isDesktop
        ? EdgeInsets.symmetric(
            horizontal: horizontal ?? ConstsUtils.sSmall,
            vertical: vertical ?? ConstsUtils.sSmall,
          )
        : EdgeInsets.symmetric(
            horizontal: horizontal ?? ConstsUtils.xSmall,
            vertical: vertical ?? ConstsUtils.xSmall,
          ),
    child: child,
  );
}
