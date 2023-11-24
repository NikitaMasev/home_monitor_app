import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dfa_common/dfa_common.dart';
import 'package:dio/dio.dart';
import 'package:home_monitor/data/sources/dfa/dfa_client.dart';

final class DfaClientImpl implements DfaClient {
  DfaClientImpl({
    required final Dio dio,
  })  : _dio = dio;

  final Dio _dio;

  @override
  Future<bool> checkUpgrade() async {
    final needUpgrade = await _dio.get(
      '/${RequestUpgradePaths.checkUpgrade}',
    );
    final decoded = utf8.decode(needUpgrade.data as List<int>);
    return bool.parse(decoded);
  }

  @override
  Future<List<int>> downloadLatestVersion(
    final void Function(int percent) onProgress,
  ) async {
    final response = await _dio.get(
      '/${RequestUpgradePaths.upgrade}',
      onReceiveProgress: (final count, final total) {
        if (total != -1) {
          onProgress((count / total * 100).toInt());
        } else {
          onProgress(0);
        }
      },
    );

    if (response.data != null) {
      return response.data as List<int>;
    } else {
      throw Exception('Downloaded file bytes are damaged');
    }
  }

  @override
  Future<bool> available() async {
    final completer = Completer<bool>();
    final noScheme = _dio.options.baseUrl.split('//').last;
    final ipAndPort = noScheme.split(':');

    await Socket.connect(
      ipAndPort.first,
      int.parse(ipAndPort.last),
      timeout: const Duration(seconds: 2),
    ).then((final socket) {
      socket.destroy();
      completer.complete(true);
    }).catchError((final error) {
      completer.complete(false);
    });

    return completer.future;
  }
}
