import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_responsive/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../utils/styles/styles.dart';
import '../../widgets/widgets.dart';

class SingUpCreateHome extends StatefulWidget {
  final TextEditingController controllerNameShop;
  final TextEditingController controllerNameLinkShop;
  final TextEditingController controllerDescriptionShop;
  final TextEditingController controllerPhoneShop;
  final VoidCallback onTapCreate;
  const SingUpCreateHome(
      {super.key,
      required this.controllerNameShop,
      required this.controllerNameLinkShop,
      required this.controllerDescriptionShop,
      required this.controllerPhoneShop,
      required this.onTapCreate});

  @override
  State<SingUpCreateHome> createState() => _SingUpCreateHomeState();
}

class _SingUpCreateHomeState extends State<SingUpCreateHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controllerNameShop.addListener(updateNameShopLink);
  }

  void updateNameShopLink() {
    String nameShopLink = widget.controllerNameShop.text
        .replaceAll(RegExp(r'\s{1,}'), '-')
        .toLowerCase()
        .trim();
    widget.controllerNameLinkShop.text = nameShopLink;
  }

  @override
  Widget build(BuildContext context) {


    final selectedContryProvider =
        ProyectsProvider.countryProvider(context).selectedCountry;
    return Column(
      children: [
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Nombre del negocio *',
            controller: widget.controllerNameShop,
            TextInputType.text,
            onChangedText: (v) => setState(() => v),
            decoration: textFormDecoration.copyWith(
              hintText: 'Ingrese el nombre de su negocio',
            ),
            context),
        Visibility(
            visible: widget.controllerNameShop.text.isNotEmpty,
            child: Column(
              children: [
                SizedBox(height: ConstsUtils.sSmall),
                columnForm(
                    'Así se verá el enlace a tu sitio web.',
                    TextInputType.text,
                    enabled: false,
                    decoration: textFormDecoration.copyWith(
                      hintText:
                          'tunegocio.pro/${widget.controllerNameLinkShop.text}',
                    ),
                    context),
              ],
            )),
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Descripcion del negocio',
            controller: widget.controllerDescriptionShop,
            maxLines: 5,
            TextInputType.text,
            decoration: textFormDecoration.copyWith(
              hintText: 'Describa su negocio',
            ),
            context),
        SizedBox(height: ConstsUtils.sSmall),
        const CountrySearchWidget(countryCodes: [
          'EC',
          'PE',
          'CO',
          'CL',
          'AR',
          'BO',
          'US',
          'SV',
          'UY'
        ]),
        SizedBox(height: ConstsUtils.sSmall),
        if (selectedContryProvider != null)
          columnForm('Numero de contacto de tu negocio *', TextInputType.number,
              controller: widget.controllerPhoneShop,
              maxLength: selectedContryProvider.maxLength,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegexUtils.numberR)
              ],
              decoration: textFormDecoration.copyWith(
                hintText: 'Permite que tus clientes se comuniquen contigo',
              ), context),
        SizedBox(height: ConstsUtils.sSmall),
        columnForm(
            'Logo del negocio *',
            TextInputType.visiblePassword,
            onTap: () => {},
            photo: true,
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
  // widget.controllerNameShop.dispose();
  // widget.controllerNameLinkShop.dispose();
  // widget.controllerDescriptionShop.dispose();
  // widget.controllerCountryShop.dispose();
  // widget.controllerPhoneShop.dispose();
  // }
}

class CountrySearchWidget extends StatefulWidget {
  final List<String> countryCodes;

  const CountrySearchWidget({
    super.key,
    required this.countryCodes,
  });

  @override
  _CountrySearchWidgetState createState() => _CountrySearchWidgetState();
}

class _CountrySearchWidgetState extends State<CountrySearchWidget> {
  late CountryProvider _countryProvider;
  List<Country> _filteredCountries = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _countryProvider = Provider.of<CountryProvider>(context, listen: false);
    controller.addListener(_onSearchTextChanged);

    // Inicialmente, mostrar los países filtrados por código
    // _filteredCountries = _countryProvider.filterCountriesByCode(widget.countryCodes);
  }

  void _onSearchTextChanged() {
    final query = controller.text.toLowerCase();
    setState(() {
      _filteredCountries = _countryProvider
          .filterCountriesByCode(widget.countryCodes)
          .where((country) => country.name.toLowerCase().contains(query))
          .toList();
    });
  }

  void _onCountrySelected(Country country) {
    _countryProvider.selectCountry(country);
    controller.text = country.name; // O cualquier campo que prefieras
    setState(() {
      _filteredCountries = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedContryProvider =
        ProyectsProvider.countryProvider(context).selectedCountry;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Seleciona un Pais *',
            style: TextStyleUtils.textGlobal(
                fontSize: ConstsUtils.sSmall,
                fontWeight: FontWeight.bold,
                color: ColorsStyleUtils.textBlack),
          ),
        ),
        SizedBox(height: ConstsUtils.xSmall),
        TextField(
          controller: controller,
          decoration: textFormDecoration.copyWith(
            suffixIcon: selectedContryProvider != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: Image.asset(
                      selectedContryProvider.flagImage!,
                      width: 24, // Tamaño del icono
                      height: 24,
                    ),
                  )
                : const Icon(Icons.flag),
            hintText: 'Selecciona País',
          ),
          style: TextStyle(
            color: ColorsStyleUtils.backgroundBlack,
            fontWeight: FontWeight.bold,
            fontSize: ConstsUtils.sSmall,
          ),
        ),
        if (_filteredCountries.isNotEmpty)
          SizedBox(
            height: 200,
            child: ListView(
              children: _filteredCountries.map((country) {
                return ListTile(
                  focusColor: ColorsStyleUtils.backgroundWhiteOpacity,
                  title: Row(
                    children: [
                      SizedBox(
                        width: 130.0,
                        child: Text(country.name,
                            style: TextStyle(
                              color: ColorsStyleUtils.backgroundBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: ConstsUtils.sSmall,
                            )),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        country.flagImage!,
                        width: ConstsUtils.mSmall,
                      )
                    ],
                  ),
                  onTap: () => _onCountrySelected(country),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  // @override
  // void dispose() {
  //   widget.controller.removeListener(_onSearchTextChanged);
  //   widget.controller.dispose(); // Asegúrate de limpiar el controlador
  //   super.dispose();
  // }
}
