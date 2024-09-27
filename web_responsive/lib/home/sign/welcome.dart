import 'package:flutter/material.dart';
import 'package:web_responsive/utils/styles/styles.dart';

import '../../utils/utils.dart';

class WelcomeSingHome extends StatelessWidget {
  const WelcomeSingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsStyleUtils.backgroundBlack,
      height: context.screenHeight,
      width: context.screenWidth / 2,
      child: Padding(
        padding: EdgeInsets.all(ConstsUtils.mSmall),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.screenWidth,
                height: context.screenHeight / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ConstsUtils.sSmall),
                  border: Border.all(color: ColorsStyleUtils.backgroundWhite),
                ),
              ),
              SizedBox(height: ConstsUtils.sSmall),
              Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: ColorsStyleUtils.textOrange,
                    size: ConstsUtils.mSmall,
                  ),
                  SizedBox(width: ConstsUtils.xSmall),
                  Text(
                    'A/P',
                    style: TextStyleUtils.textGlobal(
                      color: ColorsStyleUtils.textWhite,
                      fontSize: ConstsUtils.mSmall,
                    ),
                  )
                ],
              ),
              SizedBox(height: ConstsUtils.sSmall),
              Text(
                'Tu negocio en linea en un solo lugar',
                style: TextStyleUtils.textGlobal(
                    color: ColorsStyleUtils.textWhite,
                    fontSize: ConstsUtils.mSmall),
              ),
              SizedBox(height: ConstsUtils.sSmall),
              Text(
                'Este sistema está impulsado\npor la tecnología de Alberto Guamán by Tinguar',
                style: TextStyleUtils.textGlobal(
                    color: ColorsStyleUtils.textWhiteOpacity,
                    fontSize: ConstsUtils.sSmall),
              )
            ],
          ),
        ),
      ),
    );
  }
}
