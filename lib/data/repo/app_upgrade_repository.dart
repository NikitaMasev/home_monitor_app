abstract interface class AppUpgradeRepository {
  Future<bool> checkUpgrade();

  Future<List<int>> downloadLatestVersion(final void Function(int) onProgress);
}
