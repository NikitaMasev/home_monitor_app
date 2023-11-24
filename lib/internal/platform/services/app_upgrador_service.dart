abstract interface class AppUpgradorService {
  Future<void> upgrade(final List<int> bytes);
}