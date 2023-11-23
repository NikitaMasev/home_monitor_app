abstract interface class DfaClient {
  ///return true if available new app version
  Future<bool> checkUpgrade();

  ///return bytes of downloaded file
  ///and it has [onProgress] callback with percent value of progress downloading
  Future<List<int>> downloadLatestVersion(final void Function(int) onProgress);

  Future<bool> available();
}
