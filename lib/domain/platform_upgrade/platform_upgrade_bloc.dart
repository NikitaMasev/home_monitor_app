import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_monitor/data/repo/app_upgrade_repository.dart';
import 'package:home_monitor/internal/platform/services/app_upgrador_service.dart';

part 'platform_upgrade_bloc.freezed.dart';

@freezed
abstract class PlatformUpgradeEvent with _$PlatformUpgradeEvent {
  const factory PlatformUpgradeEvent.check() = Check;
}

@freezed
abstract class PlatformUpgradeState with _$PlatformUpgradeState {
  const factory PlatformUpgradeState.loading() = Loading;

  const factory PlatformUpgradeState.noNeedUpgrade() = NoNeedUpgrade;

  const factory PlatformUpgradeState.upgradeAvailable() = UpgradeAvailable;

  const factory PlatformUpgradeState.downloadingUpgrade(final int percent) =
      DownloadingUpgrade;

  const factory PlatformUpgradeState.downloadingUpgradeCompleted() =
      DownloadingUpgradeCompleted;

  const factory PlatformUpgradeState.upgradeSuccess() = UpgradeSuccess;

  const factory PlatformUpgradeState.upgradeError(final String err) =
      UpgradeError;

  const factory PlatformUpgradeState.error(final String err) = Error;
}

class PlatformUpgradeBloc
    extends Bloc<PlatformUpgradeEvent, PlatformUpgradeState> {
  PlatformUpgradeBloc(
    this._appUpgradeRepository,
    this._appUpgradorService,
  ) : super(const PlatformUpgradeState.loading()) {
    on<PlatformUpgradeEvent>(
      (final event, final emit) => event.when(
        check: () => _check(emit),
      ),
    );
  }

  final AppUpgradeRepository _appUpgradeRepository;
  final AppUpgradorService _appUpgradorService;

  Future<void> _check(
    final Emitter<PlatformUpgradeState> emit,
  ) async {
    emit(const PlatformUpgradeState.loading());

    final needUpgrade = await _appUpgradeRepository.checkUpgrade();
    print('needUpgrade $needUpgrade');
    if (!needUpgrade) {
      emit(const PlatformUpgradeState.noNeedUpgrade());
    } else {
      emit(const PlatformUpgradeState.upgradeAvailable());

      var bytesUpgrade = <int>[];

      try {
        bytesUpgrade = await _appUpgradeRepository.downloadLatestVersion((final progress) {
          print('progress $progress');
          emit(PlatformUpgradeState.downloadingUpgrade(progress));
        });
      } on Exception catch(e) {
        emit(PlatformUpgradeState.error(e.toString()));
        rethrow;
      }

      if (bytesUpgrade.isEmpty) {
        emit(const PlatformUpgradeState.upgradeError('App upgrade bytes are empty.'));
      } else {
        emit(const PlatformUpgradeState.downloadingUpgradeCompleted());
        print('upgrade ${bytesUpgrade.length}');
        await _appUpgradorService.upgrade(bytesUpgrade);
        emit(const PlatformUpgradeState.upgradeSuccess());
      }
    }
  }
}
