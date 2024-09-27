import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../utils/styles/styles.dart';
import '../../widgets/widgets.dart';

class SingInHome extends StatefulWidget {
  const SingInHome({super.key});

  @override
  State<SingInHome> createState() => _SingInHomeState();
}

class _SingInHomeState extends State<SingInHome> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final accountSwitchProvider = Provider.of<AccountStateProvider>(context);

    return Form(
      key: _formKey,
      child: Container(
        color: ColorsStyleUtils.backgroundWhiteOpacity,
        height: context.screenHeight - ConstsUtils.xlSmall,
        width:
            context.isDesktop ? context.screenWidth / 2 : context.screenWidth,
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
                              fontSize: ConstsUtils.mSmall,
                            ),
                          ),
                          SizedBox(height: ConstsUtils.xxSmall),
                          Text(
                            'Hoy es un buen dia, para vender.',
                            style: TextStyleUtils.textGlobal(
                                color: ColorsStyleUtils.backgroundBlack,
                                fontSize: ConstsUtils.sSmall,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: ConstsUtils.sSmall),
                          columnForm(
                              'Correo Electronico (*)',
                              TextInputType.emailAddress,
                              controller: _controllerEmail,
                              decoration: textFormDecoration.copyWith(
                                hintText: 'Ingrese su correo',
                              ),
                              context),
                          SizedBox(height: ConstsUtils.sSmall),
                          columnForm(
                              'Contrasena (*)',
                              TextInputType.visiblePassword,
                              controller: _controllerPassword,
                              decoration: textFormDecoration.copyWith(
                                hintText: 'Ingrese Contrasena',
                              ),
                              context),
                          SizedBox(height: ConstsUtils.sSmall),
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: inkWellText('Olvidaste Contraseña',
                          //       () => accountSwitchProvider.switchSignReset()),
                          // ),
                          SizedBox(height: ConstsUtils.sSmall),
                          inkWellContainer(
                            context,
                            () => {},
                            'Iniciar Seccion',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
  }
}
