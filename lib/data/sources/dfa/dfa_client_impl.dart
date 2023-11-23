import 'package:dfa_common/dfa_common.dart';
import 'package:dio/dio.dart';
import 'package:home_monitor/data/sources/dfa/dfa_client.dart';

final class DfaClientImpl implements DfaClient {
  DfaClientImpl({
    required final Dio dio,
  }) : _dio = dio;

  final Dio _dio;
  ///TODO DART PING
  @override
  Future<bool> checkUpgrade() async {
    final needUpgrade = await _dio.get(
      RequestUpgradePaths.checkUpgrade,
    );
    return bool.parse(needUpgrade.data.toString());
  }

  @override
  Future<List<int>> downloadLatestVersion(
    final void Function(int percent) onProgress,
  ) async {
    final response = await _dio.get(
      RequestUpgradePaths.upgrade,
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
  Future<bool> available() {
    // TODO: implement available
    throw UnimplementedError();
  }
}
