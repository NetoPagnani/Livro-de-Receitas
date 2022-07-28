import 'package:flutter/material.dart';
import '../components/drawer_main.dart';
import '../models/settings.dart';

class SettingsScrenn extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScrenn(this.settings, this.onSettingsChanged);

  @override
  State<SettingsScrenn> createState() => _SettingsScrennState();
}

class _SettingsScrennState extends State<SettingsScrenn> {
  late Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Arima',
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: 'Arima',
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            style: const TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
            'Configurações'),
      ),
      drawer: DrawerMain(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: TextStyle(
                fontFamily: 'Arima',
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glúten',
                  'So exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'So exibe refeições sem Lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'So exibe refeições veganas',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'So exibe refeições vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
