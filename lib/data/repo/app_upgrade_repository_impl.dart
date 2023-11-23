import 'package:home_monitor/data/repo/app_upgrade_repository.dart';
import 'package:home_monitor/data/sources/dfa/dfa_client.dart';

final class AppUpgradeRepositoryImpl implements AppUpgradeRepository {
  AppUpgradeRepositoryImpl({
    required final DfaClient dfaClientLocal,
    required final DfaClient dfaClientRemote,
  })  : _dfaClientLocal = dfaClientLocal,
        _dfaClientRemote = dfaClientRemote;

  final DfaClient _dfaClientLocal;
  final DfaClient _dfaClientRemote;

  @override
  Future<bool> checkUpgrade() async {
    if (await _dfaClientLocal.available()) {
      return _dfaClientLocal.checkUpgrade();
    } else {
      return _dfaClientRemote.checkUpgrade();
    }
  }

  @override
  Future<List<int>> downloadLatestVersion(
    final void Function(int percent) onProgress,
  ) async {
    if (await _dfaClientLocal.available()) {
      return _dfaClientLocal.downloadLatestVersion(onProgress);
    } else {
      return _dfaClientRemote.downloadLatestVersion(onProgress);
    }
  }
}
