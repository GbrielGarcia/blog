import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../utils/models/models.dart';
import '../../utils/styles/styles.dart';
import '../../widgets/widgets.dart';
import 'sign.dart';

class SignUpHome extends StatefulWidget {
  const SignUpHome({super.key});

  @override
  State<SignUpHome> createState() => _SignUpHomeState();
}

class _SignUpHomeState extends State<SignUpHome> {
  final TextEditingController _controllerUser = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordVerification =
      TextEditingController();
  //
  final TextEditingController _controllerNameShop = TextEditingController();
  final TextEditingController _controllerNameLinkShop = TextEditingController();
  final TextEditingController _controllerDescriptionShop =
      TextEditingController();
  final TextEditingController _controllerPhoneShop = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final accountSwitchProvider = Provider.of<AccountStateProvider>(context);

    final countryProvider =
        ProyectsProvider.countryProvider(context).selectedCountry;

    // Función para registrar al usuario
    void signUp(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        // Imprimir los valores de los controladores para verificar
        print("Nombre de usuario: ${_controllerUser.text}");
        print("Correo electrónico: ${_controllerEmail.text}");
        print("Contraseña: ${_controllerPasswordVerification.text}");

        if (_controllerUser.text.isEmpty ||
            _controllerEmail.text.isEmpty ||
            _controllerPasswordVerification.text.isEmpty ||
            _controllerNameShop.text.isEmpty ||
            countryProvider != null) {
          SnackBarWidget.showErrorSnackBar(
              context, 'Todos los campos ( * ) deben ser llenados');

          return;
        }

        if (_controllerPhoneShop.text.isEmpty) {
          SnackBarWidget.showErrorSnackBar(
              context, 'Debe de ingresar su numero');
          return;
        }

        if (_controllerPhoneShop.text != _controllerPhoneShop.text) {
          SnackBarWidget.showErrorSnackBar(
              context, 'Debe de poner un numero valido');
          return;
        }
      }
    }

    // Control del widget actual basado en el estado de la cuenta
    Widget currentWidget;
    switch (accountSwitchProvider.currentState) {
      case AccoutState.signUp:
        currentWidget = SingUpHome(
          controllerUser: _controllerUser,
          controllerEmail: _controllerEmail,
          controllerPassword: _controllerPassword,
          controllerPasswordVerification: _controllerPasswordVerification,
        );
        break;
      case AccoutState.signUpCreate:
        currentWidget = SingUpCreateHome(
          controllerNameShop: _controllerNameShop,
          controllerNameLinkShop: _controllerNameLinkShop,
          controllerDescriptionShop: _controllerDescriptionShop,
          controllerPhoneShop: _controllerPhoneShop,
          onTapCreate: () {
            if (kDebugMode) {
              print('Creando cuenta...');
            }
            signUp(context);
          },
        );
        break;
      default:
        currentWidget = Container();
    }
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          color: ColorsStyleUtils.backgroundWhiteOpacity,
          height: context.screenHeight - ConstsUtils.xlSmall,
          width:
              context.isDesktop ? context.screenWidth / 2 : context.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: context.isDesktop
                      ? EdgeInsets.all(ConstsUtils.xSmall)
                      : EdgeInsets.all(ConstsUtils.xSmall),
                  child: Container(
                    width: 550.0,
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
                            'Crear tu cuenta gratis',
                            style: TextStyleUtils.textGlobal(
                                color: ColorsStyleUtils.backgroundBlack,
                                fontSize: ConstsUtils.sSmall,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: ConstsUtils.sSmall),
                          currentWidget,
                          SizedBox(height: ConstsUtils.sSmall),
                          if (accountSwitchProvider.currentState ==
                              AccoutState.signUp)
                            inkWellContainer(
                              context,
                              () {
                                if (_formKey.currentState!.validate()) {
                                  if (_controllerUser.text.isEmpty ||
                                      _controllerEmail.text.isEmpty ||
                                      _controllerPassword.text.isEmpty ||
                                      _controllerPasswordVerification
                                          .text.isEmpty) {
                                    SnackBarWidget.showErrorSnackBar(context,
                                        'Complete todos los campos para continuar.');
                                    return;
                                  }

                                  // Validación para verificar si las contraseñas coinciden
                                  if (_controllerPassword.text !=
                                      _controllerPasswordVerification.text) {
                                    SnackBarWidget.showErrorSnackBar(context,
                                        'Las contraseñas deben ser iguales.');
                                    return;
                                  }

                                  // Validación del correo electrónico
                                  if (!RegexUtils.isValidEmail(
                                      _controllerEmail.text)) {
                                    RegexUtils.showEmailValidationSnackBar(
                                        context);
                                    return;
                                  }

                                  accountSwitchProvider.switchSignUpCreate();
                                }

                                accountSwitchProvider.switchSignUpCreate();
                              },
                              'Siguiente',
                            ),
                          if (accountSwitchProvider.currentState ==
                              AccoutState.signUpCreate)
                            Column(
                              children: [
                                inkWellContainer(
                                  context,
                                  () => signUp(context),
                                  'Crear Cuenta',
                                ),
                                SizedBox(height: ConstsUtils.sSmall),
                                inkWellContainer(
                                  context,
                                  () => accountSwitchProvider.switchSignUp(),
                                  color: ColorsStyleUtils.textOrange,
                                  'Volver',
                                ),
                              ],
                            ),
                          SizedBox(height: ConstsUtils.mSmall),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _controllerUser.dispose();
  //   _controllerEmail.dispose();
  //   _controllerPassword.dispose();
  //   _controllerPasswordVerification.dispose();
  //   _controllerNameShop.dispose();
  //   _controllerNameLinkShop.dispose();
  //   _controllerDescriptionShop.dispose();
  //   _controllerCountryShop.dispose();
  //   _controllerPhoneShop.dispose();
  // }
}
