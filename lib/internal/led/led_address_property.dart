const ledAddressEffectsDescription = <int, String>{
  2: 'Rainbow fade',
  3: 'Rainbow loop',
  4: 'Rainbow burst',
  5: 'Color bounce',
  6: 'Color bounce fade',
  7: 'EMS lights',
  8: 'EMS lights all',
  9: 'Flicker',
  10: 'Pulse one color',
  11: 'Pulse changed color',
  12: 'Fade vertical',
  13: 'Rule 30',
  14: 'Random march',
  15: 'Red-white-blue march',
  16: 'White-blue gradient',
  17: 'Pop horizontal',
  18: 'Quad bright curve',
  19: 'Flame',
  20: 'Rainbow vertical',
  21: 'Rainbow color pop',
  22: 'EMS lights strobe',
  23: 'RGB propeller',
  24: 'Kitt',
  25: 'Matrix',
  26: 'New rainbow loop',
  27: 'Color wipe',
  28: 'Fire',
  29: 'Rainbow cycle',
  30: 'Twinkle random',
  31: 'Running lights',
  32: 'Strobe',
  33: 'One color all',
  34: 'Theater chase',
  35: 'Theater chase rainbow',
};

String getLedAddressDescriptionByIndex(final int index) =>
    ledAddressEffectsDescription.values.elementAt(index);

int getLedAddressIdByIndex(final int index) =>
    ledAddressEffectsDescription.keys.elementAt(index);

int getLedAddressIndexById(final int id) =>
    ledAddressEffectsDescription.entries.indexed.where((final indexedEntry) {
      final (index, entry) = indexedEntry;
      return entry.key == id;
    }).map((final indexedEntry) {
      final (index, entry) = indexedEntry;
      return index;
    }).first;
