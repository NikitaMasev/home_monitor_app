import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LedCctConfig extends StatefulWidget {
  const LedCctConfig({
    required this.initialBrightness,
    required this.initialColorTemperature,
    required this.onBrightness,
    required this.onColorTemperature,
    super.key,
  });

  final double initialBrightness;
  final double initialColorTemperature;
  final ValueChanged<double> onBrightness;
  final ValueChanged<double> onColorTemperature;

  @override
  State<LedCctConfig> createState() => _LedCctConfigState();
}

class _LedCctConfigState extends State<LedCctConfig> {
  final _controllerBrightness = StreamController<double>();
  final _controllerColorTemperature = StreamController<double>();

  StreamSubscription? _subBrightness;
  StreamSubscription? _subColorTemperature;

  @override
  void initState() {
    _subBrightness = _controllerBrightness.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen(widget.onBrightness);
    _subColorTemperature = _controllerColorTemperature.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen(widget.onColorTemperature);
    super.initState();
  }

  @override
  void dispose() {
    _subBrightness?.cancel();
    _subColorTemperature?.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const Spacer(),
        Center(
          child: SleekCircularSlider(
            max: 1,
            initialValue: widget.initialBrightness,
            appearance: CircularSliderAppearance(
              size: 200,
              customWidths: CustomSliderWidths(progressBarWidth: 10),
              customColors: CustomSliderColors(
                progressBarColors: [Colors.amber, Colors.white70],
                //gradientStartAngle: 120,
              ),
              infoProperties: InfoProperties(
                bottomLabelText: 'Яркость',
                bottomLabelStyle: textTheme.headlineSmall,
                mainLabelStyle: textTheme.displaySmall!.copyWith(
                  color: Colors.amber,
                ),
                modifier: (final val) => '${(val * 100).toInt()} %',
              ),
            ),
            onChangeEnd: _controllerBrightness.add,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: SleekCircularSlider(
              max: 1,
              initialValue: widget.initialColorTemperature,
              appearance: CircularSliderAppearance(
                size: 200,
                customWidths: CustomSliderWidths(progressBarWidth: 10),
                customColors: CustomSliderColors(
                  progressBarColors: [
                    Colors.amber.shade100,
                    Colors.blue.shade100,
                  ],
                ),
                infoProperties: InfoProperties(
                  bottomLabelText: 'Оттенок',
                  bottomLabelStyle: textTheme.headlineSmall,
                  mainLabelStyle: textTheme.titleLarge!.copyWith(
                    color: Colors.amber,
                  ),
                  modifier: (final val) {
                    if (val >= 0.45 && val <= 0.55) {
                      return 'Смешанный';
                    } else if (val >= 0.2 && val < 0.45) {
                      return 'Холоднее';
                    } else if (val < 0.2) {
                      return 'Холодный';
                    } else if (val > 0.55 && val <= 0.8) {
                      return 'Теплее';
                    } else if (val > 0.8) {
                      return 'Теплый';
                    }
                    return '';
                  },
                ),
              ),
              onChangeEnd: _controllerColorTemperature.add,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
