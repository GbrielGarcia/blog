import 'package:flutter/material.dart';
import 'package:web_responsive/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class SingUpHome extends StatefulWidget {
  final TextEditingController controllerUser;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPassword;
  final TextEditingController controllerPasswordVerification;
  const SingUpHome(
      {super.key,
      required this.controllerUser,
      required this.controllerEmail,
      required this.controllerPassword,
      required this.controllerPasswordVerification});

  @override
  State<SingUpHome> createState() => _SingUpHomeState();
}

class _SingUpHomeState extends State<SingUpHome> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final accountSwitchProvider = Provider.of<AccountStateProvider>(context);

    return Column(
      children: [
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Nombre de Usuario *',
            controller: widget.controllerUser,
            TextInputType.text,
            decoration: textFormDecoration.copyWith(
              hintText: 'Escriba su nombre',
            ),
            context),
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Correo Electronico *',
            controller: widget.controllerEmail,
            TextInputType.emailAddress,
            decoration: textFormDecoration.copyWith(
              hintText: 'Ingrese su correo',
            ),
            context),
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Contrasena *',
            controller: widget.controllerPassword,
            TextInputType.visiblePassword,
            decoration: textFormDecoration.copyWith(
              hintText: 'Ingrese Contrasena',
            ),
            context),
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Confirmar Contrasena *',
            controller: widget.controllerPasswordVerification,
            TextInputType.visiblePassword,
            decoration: textFormDecoration.copyWith(
              hintText: 'Confirme su Contrasena',
            ),
            context),
        SizedBox(height: ConstsUtils.sSmall),
      ],
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widget.controllerUser.dispose();
  //   widget.controllerEmail.dispose();
  //   widget.controllerPassword.dispose();
  //   widget.controllerPasswordVerification.dispose();
  // }
}
