import 'package:flutter/material.dart';
import 'package:home_monitor/internal/led/led_address_property.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:home_monitor/presentation/widgets/tile_color_picker.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:widget_slider/widget_slider.dart';

class LedAddressConfig extends StatefulWidget {
  const LedAddressConfig({
    required this.initialFirstColor,
    required this.initialSecondColor,
    required this.initialBrightness,
    required this.initialLedEffectId,
    required this.onFirstColor,
    required this.onSecondColor,
    required this.onBrightness,
    required this.onLedEffectId,
    super.key,
  });

  final Color initialFirstColor;
  final Color initialSecondColor;
  final double initialBrightness;
  final int initialLedEffectId;
  final ValueChanged<Color> onFirstColor;
  final ValueChanged<Color> onSecondColor;
  final ValueChanged<double> onBrightness;
  final ValueChanged<int> onLedEffectId;

  @override
  State<LedAddressConfig> createState() => _LedAddressConfigState();
}

class _LedAddressConfigState extends State<LedAddressConfig> {
  late Color firstSelectedColor; // Color for picker in dialog using onChanged
  late Color secondSelectedColor; // Color for picker using color select dialog.

  final controller = SliderController(
    duration: const Duration(milliseconds: 600),
  );

  @override
  void initState() {
    firstSelectedColor = widget.initialFirstColor;
    secondSelectedColor = widget.initialSecondColor;
    final indexLedEffect = getLedAddressIndexById(widget.initialLedEffectId);
    print('INDEX LED EFFECT $indexLedEffect');
    Future.delayed(Duration(seconds: 0), () {
      print('DELAYED STARTED');
      controller.moveTo!(indexLedEffect);
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final cardTheme = Theme.of(context).cardTheme;
    return ListView(
      children: <Widget>[
        TileColorPicker(
          startColor: firstSelectedColor,
          onColorSelected: (final newColor) {
            firstSelectedColor = newColor;
            setState(() {});
            widget.onFirstColor(firstSelectedColor);
          },
          title: 'Первый выбранный цвет',
        ),
        TileColorPicker(
          startColor: secondSelectedColor,
          onColorSelected: (final newColor) {
            secondSelectedColor = newColor;
            setState(() {});
            widget.onFirstColor(secondSelectedColor);
          },
          title: 'Второй выбранный цвет',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: SleekCircularSlider(
            min: 0,
            max: 1,
            initialValue: widget.initialBrightness,
            appearance: CircularSliderAppearance(
              size: 200,
              customWidths: CustomSliderWidths(progressBarWidth: 10),
              customColors: CustomSliderColors(
                progressBarColors: [firstSelectedColor, secondSelectedColor],
                gradientStartAngle: 120,
              ),
              infoProperties: InfoProperties(
                bottomLabelText: 'Яркость',
                bottomLabelStyle:
                    Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
              ),
            ),
            onChangeEnd: widget.onBrightness,
          ),
        ),
        WidgetSlider(
          fixedSize: 170,
          controller: controller,
          itemCount: ledAddressEffectsDescription.length,
          onMove: (final index) => widget.onLedEffectId(
            getLedAddressIdByIndex(index),
          ),
          itemBuilder: (final ctx, final index, final activeIndex) => Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Эффект',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Assets.svg.led.svg(width: 46),
                  Text(
                    getLedAddressDescriptionByIndex(index),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
