import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../utils/styles/styles.dart';
import '../../widgets/widgets.dart';

class SingResetHome extends StatelessWidget {
  const SingResetHome({super.key});

  @override
  Widget build(BuildContext context) {
    final accountSwitchProvider = Provider.of<AccountStateProvider>(context);

    return Container(
      color: ColorsStyleUtils.backgroundWhiteOpacity,
      height: context.screenHeight - ConstsUtils.xlSmall,
      width: context.isDesktop ? context.screenWidth / 2 : context.screenWidth,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: context.isDesktop
                    ? EdgeInsets.all(ConstsUtils.xSmall)
                    : EdgeInsets.all(ConstsUtils.xSmall),
                child: Container(
                  width: 550.0,
                  height: 520.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ConstsUtils.sSmall),
                    border: ConstsBorderUtils.getCustomBorder(context),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.isDesktop
                            ? ConstsUtils.mSmall
                            : ConstsUtils.sSmall,
                        vertical: ConstsUtils.sSmall),
                    child: Column(
                      children: [
                        SizedBox(height: ConstsUtils.sSmall),
                        Icon(
                          Icons.emergency_outlined,
                          color: ColorsStyleUtils.textOrange,
                          size: ConstsUtils.mSmall,
                        ),
                        SizedBox(height: ConstsUtils.sSmall),
                        Text(
                          'Multi Negocios',
                          style: TextStyleUtils.textGlobal(
                              color: ColorsStyleUtils.backgroundBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: ConstsUtils.mSmall),
                        ),
                        SizedBox(height: ConstsUtils.xxSmall),
                        Text(
                          'No, olvidaste tu Contrasena',
                          style: TextStyleUtils.textGlobal(
                              color: ColorsStyleUtils.backgroundBlack,
                              fontSize: ConstsUtils.sSmall,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: ConstsUtils.sSmall),
                        columnForm(
                            'Correo Electronico',
                            TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                              hintText: 'Ingrese su correo',
                            ),
                            context),
                        SizedBox(height: ConstsUtils.sSmall),
                        inkWellContainer(
                          context,
                          () {
                            if (kDebugMode) {
                              print('Recuperar Informacion');
                            }
                          },
                          'Recuperar Informacion',
                        ),
                        SizedBox(height: ConstsUtils.mSmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Aun no tienes cuenta?',
                              style: TextStyleUtils.textGlobal(
                                color: ColorsStyleUtils.backgroundBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: ConstsUtils.sSmall),
                            inkWellText('Crear Cuenta!',
                                () => accountSwitchProvider.switchSignUp()),
                          ],
                        ),
                        SizedBox(height: ConstsUtils.sSmall),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ya tienes una cuenta?',
                              style: TextStyleUtils.textGlobal(
                                color: ColorsStyleUtils.backgroundBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: ConstsUtils.sSmall),
                            inkWellText('Ingresar!',
                                () => accountSwitchProvider.switchSignIn()),
                          ],
                        ),
                        SizedBox(height: ConstsUtils.sSmall),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
