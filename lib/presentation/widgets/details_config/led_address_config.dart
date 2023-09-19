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
  late Color firstSelectedColor;
  late Color secondSelectedColor;
  ///Changed true after playing slider animation to already selected led effect.
  ///Needed for removing spam to [onLedEffectId] at start.
  var _sliderInitialized = false;

  final controller = SliderController(
    duration: const Duration(milliseconds: 600),
  );

  @override
  void initState() {
    firstSelectedColor = widget.initialFirstColor;
    secondSelectedColor = widget.initialSecondColor;

    final indexLedEffect = getLedAddressIndexById(widget.initialLedEffectId);

    ///Hack for playing animation of the WidgetSlider straightaway after
    ///build function.
    Future<void>.delayed(
      Duration.zero,
      () => controller.moveTo!(indexLedEffect).then(
        (final _) => _sliderInitialized = true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
          },
          title: 'Второй выбранный цвет',
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
                progressBarColors: [firstSelectedColor, secondSelectedColor],
                gradientStartAngle: 120,
              ),
              infoProperties: InfoProperties(
                bottomLabelText: 'Яркость',
                bottomLabelStyle: textTheme.headlineSmall,
                mainLabelStyle: textTheme.displaySmall!.copyWith(
                  color: secondSelectedColor,
                ),
                modifier: (final val) => '${(val * 100).toInt()} %',
              ),
            ),
            onChangeEnd: widget.onBrightness,
          ),
        ),
        WidgetSlider(
          fixedSize: 180,
          controller: controller,
          itemCount: ledAddressEffectsDescription.length,
          onMove: (final index) {
            if (_sliderInitialized) {
              widget.onLedEffectId(getLedAddressIdByIndex(index));
            }
          },
          itemBuilder: (final ctx, final index, final activeIndex) => Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Эффект',
                    textAlign: TextAlign.left,
                    style: textTheme.bodyLarge,
                  ),
                  Assets.svg.led.svg(
                    width: 56,
                    colorFilter: ColorFilter.mode(
                      secondSelectedColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    getLedAddressDescriptionByIndex(index),
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall,
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
