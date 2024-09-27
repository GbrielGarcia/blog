import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../providers/providers.dart';

class FilterModal extends StatefulWidget {
  final List<String> countryCodes;
  final CountryProvider provider;
  final Function(Country) onCountrySelected;
  FilterModal({
    required this.countryCodes,
    required this.provider,
    required this.onCountrySelected,
  });

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  List<Country> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = widget.provider.getCountriesByCode(widget.countryCodes);
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = widget.provider
          .getCountriesByCode(widget.countryCodes)
          .where((country) =>
          country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(25)
          )
      ),
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar país',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: filterCountries,
            ),
          ),
          if (filteredCountries.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'No se encontraron países',
                style: TextStyle(color: Colors.red),
              ),
            ),
          for (final country in filteredCountries)
            Column(
              children: [
                ListTile(
                  leading: Text(
                    country.flag,
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  title: Text(
                    country.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    widget.onCountrySelected(country);
                    if (kDebugMode) {
                      if (kDebugMode) {
                        print(
                            "Seleccionaste: ${country.name}, ${country.dialCode}, ${country.maxLength}");
                      }
                    }
                  },
                ),
                const Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

void showFilterModal(
    BuildContext context,
    List<String> countryCodes,
    CountryProvider provider,
    Function(Country) onCountrySelected,
    ) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: FilterModal(
          countryCodes: countryCodes,
          provider: provider,
          onCountrySelected: onCountrySelected,
        ),
      );
    },
  );
}
