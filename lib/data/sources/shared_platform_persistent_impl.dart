import 'dart:convert';

import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/models/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _user = 'user';

class SharedPlatformPersistentImpl implements SharedPersistent {
  SharedPlatformPersistentImpl({required this.shared});

  final SharedPreferences shared;

  @override
  Future<Client?> getSavedClient() async {
    final rawData = shared.getString(_user);

    if (rawData == null) {
      return null;
    } else {
      final map = jsonDecode(rawData) as Map<String, dynamic>;
      return Client.fromJson(map);
    }
  }

  @override
  Future<void> saveClient(final Client? client) async {
    if (client == null) {
      await shared.remove(_user);
    } else {
      final map = client.toJson();
      await shared.setString(_user, jsonEncode(map));
    }
  }
}
