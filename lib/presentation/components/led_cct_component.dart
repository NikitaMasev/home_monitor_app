import 'package:flutter/material.dart';
import 'package:home_monitor/internal/led/led_cct_data_copy.dart';
import 'package:home_monitor/internal/led/led_cct_data_normalizer.dart';
import 'package:home_monitor/presentation/widgets/details_config/led_cct_config.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';
import 'package:provider/provider.dart';

class LedCctComponent extends StatefulWidget {
  const LedCctComponent({
    required this.ledCctData,
    required this.idDevice,
    super.key,
  });

  final LedCctData ledCctData;
  final int idDevice;

  @override
  State<LedCctComponent> createState() => _LedCctComponentState();
}

class _LedCctComponentState extends State<LedCctComponent> {
  late final IotDevicesBloc _iotDevicesBloc;
  late double _brightness;
  late double _colorTemperature;

  @override
  void initState() {
    _iotDevicesBloc = context.read<IotDevicesBloc>();
    _brightness = widget.ledCctData.getBrightnessNullOne();
    _colorTemperature = widget.ledCctData.getColorTemperatureNullOne();
    super.initState();
  }

  void _onBrightnessSelected(final double value) {
    _brightness = value;
    _pushNewData();
  }

  void _onColorTemperatureSelected(final double value) {
    _colorTemperature = value;
    _pushNewData();
  }

  void _pushNewData() {
    final newLedCctData = widget.ledCctData
        .copyWithBrightness(_brightness)
        .copyWithColorTemperature(_colorTemperature);

    _iotDevicesBloc.add(
      IotDevicesEvent.controlDevice(
        ControlData(
          iotIdControl: widget.idDevice,
          typeControl: TypeControl.ledCct,
          configControl: '${newLedCctData.brightness}'
              ':${newLedCctData.colorTemperature}'
              ':${newLedCctData.powerOn ? 1 : 0}',
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) => LedCctConfig(
        initialBrightness: _brightness,
        initialColorTemperature: _colorTemperature,
        onBrightness: _onBrightnessSelected,
        onColorTemperature: _onColorTemperatureSelected,
      );
}
