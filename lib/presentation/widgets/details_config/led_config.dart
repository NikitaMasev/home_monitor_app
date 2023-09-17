import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/tile_color_picker.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LedConfig extends StatefulWidget {
  const LedConfig({
    required this.initialColor,
    required this.initialBrightness,
    required this.onColor,
    required this.onBrightness,
    super.key,
  });

  final Color initialColor;
  final double initialBrightness;
  final ValueChanged<Color> onColor;
  final ValueChanged<double> onBrightness;

  @override
  State<LedConfig> createState() => _LedConfigState();
}

class _LedConfigState extends State<LedConfig> {
  late Color selectedColor; // Color for picker in dialog using onChanged

  @override
  void initState() {
    selectedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final cardTheme = Theme.of(context).cardTheme;
    return ListView(
      children: <Widget>[
        TileColorPicker(
          startColor: selectedColor,
          onColorSelected: (final newColor) {
            selectedColor = newColor;
            setState(() {});
            widget.onColor(selectedColor);
          },
          title: 'Выбранный цвет',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: SleekCircularSlider(
            max: 1,
            initialValue: widget.initialBrightness,
            appearance: CircularSliderAppearance(
              size: 200,
              customWidths: CustomSliderWidths(progressBarWidth: 10),
              customColors: CustomSliderColors(
                progressBarColors: [
                  selectedColor,
                  Theme.of(context).colorScheme.primary,
                ],
                gradientStartAngle: 120,
              ),
              infoProperties: InfoProperties(
                bottomLabelText: 'Яркость',
                bottomLabelStyle:
                    Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                modifier: (final val) => '${(val * 100).toInt()} %',
              ),
            ),
            onChangeEnd: widget.onBrightness,
          ),
        ),
      ],
    );
  }
}
