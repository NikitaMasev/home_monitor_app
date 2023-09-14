import 'package:auto_route/auto_route.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/tile_color_picker.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';

@RoutePage()
class LedAddressDetailPage extends StatelessWidget {
  const LedAddressDetailPage({
    required this.iotDevicesBloc,
    required this.ledData,
  });

  final IotDevicesBloc iotDevicesBloc;
  final LedData ledData;

  @override
  Widget build(final BuildContext context) {
    return ColorPickerPage();
    return Scaffold(
      body: Text('asf'),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  late Color firstSelectedColor; // Color for picker in dialog using onChanged
  late Color secondSelectedColor; // Color for picker using color select dialog.

  @override
  void initState() {
    firstSelectedColor = Colors.red;
    secondSelectedColor = const Color(0xFFA239CA);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final cardTheme = Theme.of(context).cardTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Настройки адресной ленты'),
      ),
      body: ListView(
        children: <Widget>[
          TileColorPicker(
            startColor: firstSelectedColor,
            onColorSelected: (final newColor){
              firstSelectedColor = newColor;
              setState(() {

              });
            },
            title: 'Первый выбранный цвет',
          ),
          TileColorPicker(
            startColor: secondSelectedColor,
            onColorSelected: (final newColor){
              secondSelectedColor = newColor;
              setState(() {

              });
            },
            title: 'Второй выбранный цвет',
          ),
        ],
      ),
    );
  }
}
