import 'package:flutter/material.dart';
import 'package:home_monitor/internal/led/led_data_copy.dart';
import 'package:home_monitor/internal/led/led_data_normalizer_hsv.dart';
import 'package:home_monitor/presentation/widgets/details_config/rgb_config.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';
import 'package:provider/provider.dart';

class RgbComponent extends StatefulWidget {
  const RgbComponent({
    required this.ledData,
    required this.idDevice,
    super.key,
  });

  final LedData ledData;
  final int idDevice;

  @override
  State<RgbComponent> createState() => _RgbComponentState();
}

class _RgbComponentState extends State<RgbComponent> {
  late final IotDevicesBloc _iotDevicesBloc;
  late Color _color;
  late double _brightness;

  @override
  void initState() {
    _iotDevicesBloc = context.read<IotDevicesBloc>();
    _color = HSVColor.fromAHSV(
      1,
      widget.ledData.getHue360(),
      widget.ledData.getSatNulOne(),
      widget.ledData.getValNulOne(),
    ).toColor();
    _brightness = widget.ledData.getBrightnessNullOne();
    super.initState();
  }

  void _onColorSelected(final Color newColor) {
    _color = newColor;
    _pushNewData();
  }

  void _onBrightnessSelected(final double value) {
    print('_onBrightnessSelected $value');
    _brightness = value;
    _pushNewData();
  }

  void _pushNewData() {
    final newLedData = widget.ledData
        .copyWithColor(
          _color,
        )
        .copyWithBrightness(
          _brightness,
        );

    _iotDevicesBloc.add(
      IotDevicesEvent.controlDevice(
        ControlData(
          iotIdControl: widget.idDevice,
          typeControl: TypeControl.rgba,
          configControl: '${newLedData.h}:${newLedData.s}:${newLedData.v}:'
              '${newLedData.mode}:${newLedData.powerOn ? 1 : 0}',
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => RgbConfig(
        initialColor: _color,
        initialBrightness: _brightness,
        onColor: _onColorSelected,
        onBrightness: _onBrightnessSelected,
      );
}
