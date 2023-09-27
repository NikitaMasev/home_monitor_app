import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_monitor/internal/led/led_address_property.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:home_monitor/presentation/widgets/tile_color_picker.dart';
import 'package:rxdart/rxdart.dart';
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
  late Color _firstSelectedColor;
  late Color _secondSelectedColor;

  ///Changed true after playing slider animation to already selected led effect.
  ///Needed for removing spam to [onLedEffectId] at start.
  var _sliderInitialized = false;

  final _controllerLedEffects = SliderController(
    duration: const Duration(milliseconds: 600),
  );

  final _controllerSelectionFirstColor = StreamController<Color>();
  StreamSubscription? _subFirstColor;

  @override
  void initState() {
    _firstSelectedColor = widget.initialFirstColor;
    _secondSelectedColor = widget.initialSecondColor;

    final indexLedEffect = getLedAddressIndexById(widget.initialLedEffectId);

    ///Hack for playing animation of the WidgetSlider straightaway after
    ///build function.
    Future<void>.delayed(
      Duration.zero,
      () => _controllerLedEffects.moveTo!(indexLedEffect).then(
        (final _) => _sliderInitialized = true,
      ),
    );

    _subFirstColor = _controllerSelectionFirstColor.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen(widget.onFirstColor);
    super.initState();
  }

  @override
  void dispose() {
    _subFirstColor?.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      children: <Widget>[
        TileColorPicker(
          startColor: _firstSelectedColor,
          onColorSelected: (final newColor) {
            _firstSelectedColor = newColor;
            setState(() {});
            _controllerSelectionFirstColor.add(_firstSelectedColor);
          },
          title: 'Первый выбранный цвет',
        ),
        TileColorPicker(
          startColor: _secondSelectedColor,
          onColorSelected: (final newColor) {
            _secondSelectedColor = newColor;
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
                progressBarColors: [_firstSelectedColor, _secondSelectedColor],
                gradientStartAngle: 120,
              ),
              infoProperties: InfoProperties(
                bottomLabelText: 'Яркость',
                bottomLabelStyle: textTheme.headlineSmall,
                mainLabelStyle: textTheme.displaySmall!.copyWith(
                  color: _secondSelectedColor,
                ),
                modifier: (final val) => '${(val * 100).toInt()} %',
              ),
            ),
            onChangeEnd: widget.onBrightness,
          ),
        ),
        WidgetSlider(
          fixedSize: 180,
          controller: _controllerLedEffects,
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
                      _secondSelectedColor,
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
