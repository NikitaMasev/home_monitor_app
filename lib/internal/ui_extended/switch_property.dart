abstract interface class SwitchProperty {
  bool localSwitchState = false;

  void initSwitchState();

  void onSwitchChanged(final bool newState);
}
