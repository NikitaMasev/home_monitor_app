import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/dialogs/color_picker_dialog.dart';

class TileColorPicker extends StatelessWidget {
  const TileColorPicker({
    required this.startColor,
    required this.onColorSelected,
    required this.title,
    super.key,
  });

  final String title;
  final Color startColor;
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(final BuildContext context) => ListTile(
    title: Text(title),
    subtitle: Text(
      '${ColorTools.materialNameAndCode(
        startColor,
      )} '
          'aka ${ColorTools.nameThatColor(startColor)}',
    ),
    trailing: ColorIndicator(
      width: 44,
      height: 44,
      borderRadius: 8,
      color: startColor,
      onSelectFocus: false,
      onSelect: () {
        showCustomColorPickerDialog(
          startColor: startColor,
          context: context,
          onColorChanged: onColorSelected,
        );
      },
    ),
  );
}
