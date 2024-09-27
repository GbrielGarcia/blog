import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

class ProyectsProvider {
  static AccountStateProvider accountStateProvider(BuildContext context) =>
      Provider.of<AccountStateProvider>(context);

  static CountryProvider countryProvider(BuildContext context) =>
      Provider.of<CountryProvider>(context);
}
