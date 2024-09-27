import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_responsive/utils/styles/styles.dart';

import '../providers/providers.dart';
import '../utils/utils.dart';

Widget columnForm(
  String text,
  TextInputType textInputType,
  BuildContext context, {
  int? maxLines,
  int? maxLength,
  bool photo = false,
  VoidCallback? onTap,
  bool? padding,
  bool? enabled,
  InputDecoration? decoration,
  ValueChanged<String>? onChangedText,
  TextEditingController? controller,
  List<TextInputFormatter>? inputFormatters,
}) {

  return Padding(
    padding: padding == true
        ? context.isDesktop
            ? EdgeInsets.symmetric(horizontal: ConstsUtils.sSmall)
            : EdgeInsets.symmetric(horizontal: ConstsUtils.xSmall)
        : const EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyleUtils.textGlobal(
                fontSize: ConstsUtils.sSmall,
                fontWeight: FontWeight.bold,
                color: ColorsStyleUtils.textBlack),
          ),
        ),
        SizedBox(height: ConstsUtils.xSmall),
        Visibility(
          visible: photo == false,
          child: TextFormField(
            controller: controller,
            onChanged: onChangedText,
            style: TextStyle(
              color: ColorsStyleUtils.backgroundBlack,
              fontWeight: FontWeight.bold,
              fontSize: ConstsUtils.sSmall,
            ),
            keyboardType: textInputType,
            decoration: decoration,

            enabled: enabled ?? true,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
          ),
        ),
        Visibility(
          visible: photo == true,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: CircleAvatar(
                backgroundColor: ColorsStyleUtils.textWhiteOpacity,
                backgroundImage: null,
                maxRadius: ConstsUtils.xxlSmall,
                minRadius: ConstsUtils.xxlSmall,
                child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo,
                            size: ConstsUtils.lSmall,
                            color: ColorsStyleUtils.backgroundWhite,
                          ),
                          SizedBox(height: ConstsUtils.xSmall),
                          Text('Agregar Imagen',
                              style: TextStyleUtils.textGlobal(
                                  color: ColorsStyleUtils.textWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ConstsUtils.sSmall))
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

var textFormDecoration = InputDecoration(
  hintText: 'precio .. \$',
  labelStyle: TextStyleUtils.textGlobal(
      color: ColorsStyleUtils.backgroundBlack,
      fontWeight: FontWeight.bold,
      fontSize: ConstsUtils.sSmall),
  hintStyle: TextStyleUtils.textGlobal(
      color: ColorsStyleUtils.backgroundBlack,
      fontWeight: FontWeight.bold,
      fontSize: ConstsUtils.sSmall),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ConstsUtils.sSmall)),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsStyleUtils.textWhiteOpacity,
        width: ConstsUtils.xxsSmall,
      ),
      borderRadius: BorderRadius.circular(ConstsUtils.sSmall)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsStyleUtils.textOrange,
        width: ConstsUtils.xxSmall,
      ),
      borderRadius: BorderRadius.circular(ConstsUtils.sSmall)),
);
