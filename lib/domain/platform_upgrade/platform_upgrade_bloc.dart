import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_monitor/data/repo/app_upgrade_repository.dart';

part 'platform_upgrade_bloc.freezed.dart';

@freezed
abstract class PlatformUpgradeBlocEvent with _$PlatformUpgradeBlocEvent {
  const factory PlatformUpgradeBlocEvent.check() = Check;
}

@freezed
abstract class PlatformUpgradeBlocState with _$PlatformUpgradeBlocState {
  const factory PlatformUpgradeBlocState.loading() = Loading;

  const factory PlatformUpgradeBlocState.noNeedUpgrade() = NoNeedUpgrade;

  const factory PlatformUpgradeBlocState.upgradeAvailable() = UpgradeAvailable;

  const factory PlatformUpgradeBlocState.downloadingUpgrade(final int percent) =
      DownloadingUpgrade;

  const factory PlatformUpgradeBlocState.downloadingUpgradeCompleted() =
      DownloadingUpgradeCompleted;

  const factory PlatformUpgradeBlocState.upgradeSuccess() = UpgradeSuccess;

  const factory PlatformUpgradeBlocState.upgradeError(final String err) =
      UpgradeError;

  const factory PlatformUpgradeBlocState.error(final String err) = Error;
}

class PlatformUpgradeBlocBloc
    extends Bloc<PlatformUpgradeBlocEvent, PlatformUpgradeBlocState> {
  PlatformUpgradeBlocBloc(this._appUpgradeRepository)
      : super(const PlatformUpgradeBlocState.loading()) {
    on<PlatformUpgradeBlocEvent>(
      (final event, final emit) => event.when(
        check: () => _check(emit),
      ),
    );
  }

  final AppUpgradeRepository _appUpgradeRepository;
  ///TODO need abstract platform service

  Future<void> _check(
    final Emitter<PlatformUpgradeBlocState> emit,
  ) async {
    emit(const PlatformUpgradeBlocState.loading());

    final needUpgrade = await _appUpgradeRepository.checkUpgrade();

    if (!needUpgrade) {
      emit(const PlatformUpgradeBlocState.noNeedUpgrade());
    } else {
      emit(const PlatformUpgradeBlocState.upgradeAvailable());


    }
  }
}
