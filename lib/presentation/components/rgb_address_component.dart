import 'package:flutter/material.dart';
import 'package:home_monitor/internal/led/led_data_copy.dart';
import 'package:home_monitor/internal/led/led_data_normalizer_hsv.dart';
import 'package:home_monitor/presentation/widgets/details_config/rgb_address_config.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';
import 'package:provider/provider.dart';

class RgbAddressComponent extends StatefulWidget {
  const RgbAddressComponent({
    required this.ledData,
    required this.idDevice,
    super.key,
  });

  final LedData ledData;
  final int idDevice;

  @override
  State<RgbAddressComponent> createState() => _RgbAddressComponentState();
}

class _RgbAddressComponentState extends State<RgbAddressComponent> {
  late final IotDevicesBloc _iotDevicesBloc;
  late Color _color;
  late double _brightness;
  late int _idEffect;

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
    _idEffect = widget.ledData.mode;
    super.initState();
  }

  void _onFirstColorSelected(final Color newColor) {
    _color = newColor;
    _pushNewData();
  }

  void _onBrightnessSelected(final double value) {
    _brightness = value;
    _pushNewData();
  }

  void _onLedEffectSelected(final int id) {
    _idEffect = id;
    _pushNewData();
  }

  void _pushNewData() {
    final newLedData = widget.ledData
        .copyWithColor(
          _color,
        )
        .copyWithBrightness(
          _brightness,
        )
        .copyWithId(
          _idEffect,
        );
    print('${newLedData.h}:${newLedData.s}:${newLedData.v}');
    _iotDevicesBloc.add(
      IotDevicesEvent.controlDevice(
        ControlData(
          iotIdControl: widget.idDevice,
          typeControl: TypeControl.rgbaEffects,
          configControl: '${newLedData.h}:${newLedData.s}:${newLedData.v}:'
              '${newLedData.mode}:${newLedData.powerOn ? 1 : 0}',
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => RgbAddressConfig(
        initialFirstColor: _color,
        initialSecondColor: Colors.deepOrange,
        initialBrightness: _brightness,
        initialLedEffectId: _idEffect,
        onFirstColor: _onFirstColorSelected,
        onSecondColor: (final color) {},
        onBrightness: _onBrightnessSelected,
        onLedEffectId: _onLedEffectSelected,
      );
}
