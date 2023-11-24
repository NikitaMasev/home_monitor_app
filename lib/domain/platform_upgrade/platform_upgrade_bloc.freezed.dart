// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_upgrade_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlatformUpgradeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Check value) check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Check value)? check,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Check value)? check,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformUpgradeEventCopyWith<$Res> {
  factory $PlatformUpgradeEventCopyWith(PlatformUpgradeEvent value,
          $Res Function(PlatformUpgradeEvent) then) =
      _$PlatformUpgradeEventCopyWithImpl<$Res, PlatformUpgradeEvent>;
}

/// @nodoc
class _$PlatformUpgradeEventCopyWithImpl<$Res,
        $Val extends PlatformUpgradeEvent>
    implements $PlatformUpgradeEventCopyWith<$Res> {
  _$PlatformUpgradeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckImplCopyWith<$Res> {
  factory _$$CheckImplCopyWith(
          _$CheckImpl value, $Res Function(_$CheckImpl) then) =
      __$$CheckImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeEventCopyWithImpl<$Res, _$CheckImpl>
    implements _$$CheckImplCopyWith<$Res> {
  __$$CheckImplCopyWithImpl(
      _$CheckImpl _value, $Res Function(_$CheckImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckImpl implements Check {
  const _$CheckImpl();

  @override
  String toString() {
    return 'PlatformUpgradeEvent.check()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() check,
  }) {
    return check();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? check,
  }) {
    return check?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? check,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Check value) check,
  }) {
    return check(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Check value)? check,
  }) {
    return check?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Check value)? check,
    required TResult orElse(),
  }) {
    if (check != null) {
      return check(this);
    }
    return orElse();
  }
}

abstract class Check implements PlatformUpgradeEvent {
  const factory Check() = _$CheckImpl;
}

/// @nodoc
mixin _$PlatformUpgradeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformUpgradeStateCopyWith<$Res> {
  factory $PlatformUpgradeStateCopyWith(PlatformUpgradeState value,
          $Res Function(PlatformUpgradeState) then) =
      _$PlatformUpgradeStateCopyWithImpl<$Res, PlatformUpgradeState>;
}

/// @nodoc
class _$PlatformUpgradeStateCopyWithImpl<$Res,
        $Val extends PlatformUpgradeState>
    implements $PlatformUpgradeStateCopyWith<$Res> {
  _$PlatformUpgradeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PlatformUpgradeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements PlatformUpgradeState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$NoNeedUpgradeImplCopyWith<$Res> {
  factory _$$NoNeedUpgradeImplCopyWith(
          _$NoNeedUpgradeImpl value, $Res Function(_$NoNeedUpgradeImpl) then) =
      __$$NoNeedUpgradeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoNeedUpgradeImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$NoNeedUpgradeImpl>
    implements _$$NoNeedUpgradeImplCopyWith<$Res> {
  __$$NoNeedUpgradeImplCopyWithImpl(
      _$NoNeedUpgradeImpl _value, $Res Function(_$NoNeedUpgradeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoNeedUpgradeImpl implements NoNeedUpgrade {
  const _$NoNeedUpgradeImpl();

  @override
  String toString() {
    return 'PlatformUpgradeState.noNeedUpgrade()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoNeedUpgradeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return noNeedUpgrade();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return noNeedUpgrade?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (noNeedUpgrade != null) {
      return noNeedUpgrade();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return noNeedUpgrade(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return noNeedUpgrade?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (noNeedUpgrade != null) {
      return noNeedUpgrade(this);
    }
    return orElse();
  }
}

abstract class NoNeedUpgrade implements PlatformUpgradeState {
  const factory NoNeedUpgrade() = _$NoNeedUpgradeImpl;
}

/// @nodoc
abstract class _$$UpgradeAvailableImplCopyWith<$Res> {
  factory _$$UpgradeAvailableImplCopyWith(_$UpgradeAvailableImpl value,
          $Res Function(_$UpgradeAvailableImpl) then) =
      __$$UpgradeAvailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpgradeAvailableImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$UpgradeAvailableImpl>
    implements _$$UpgradeAvailableImplCopyWith<$Res> {
  __$$UpgradeAvailableImplCopyWithImpl(_$UpgradeAvailableImpl _value,
      $Res Function(_$UpgradeAvailableImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpgradeAvailableImpl implements UpgradeAvailable {
  const _$UpgradeAvailableImpl();

  @override
  String toString() {
    return 'PlatformUpgradeState.upgradeAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpgradeAvailableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return upgradeAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return upgradeAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (upgradeAvailable != null) {
      return upgradeAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return upgradeAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return upgradeAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (upgradeAvailable != null) {
      return upgradeAvailable(this);
    }
    return orElse();
  }
}

abstract class UpgradeAvailable implements PlatformUpgradeState {
  const factory UpgradeAvailable() = _$UpgradeAvailableImpl;
}

/// @nodoc
abstract class _$$DownloadingUpgradeImplCopyWith<$Res> {
  factory _$$DownloadingUpgradeImplCopyWith(_$DownloadingUpgradeImpl value,
          $Res Function(_$DownloadingUpgradeImpl) then) =
      __$$DownloadingUpgradeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int percent});
}

/// @nodoc
class __$$DownloadingUpgradeImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$DownloadingUpgradeImpl>
    implements _$$DownloadingUpgradeImplCopyWith<$Res> {
  __$$DownloadingUpgradeImplCopyWithImpl(_$DownloadingUpgradeImpl _value,
      $Res Function(_$DownloadingUpgradeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = null,
  }) {
    return _then(_$DownloadingUpgradeImpl(
      null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DownloadingUpgradeImpl implements DownloadingUpgrade {
  const _$DownloadingUpgradeImpl(this.percent);

  @override
  final int percent;

  @override
  String toString() {
    return 'PlatformUpgradeState.downloadingUpgrade(percent: $percent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadingUpgradeImpl &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, percent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadingUpgradeImplCopyWith<_$DownloadingUpgradeImpl> get copyWith =>
      __$$DownloadingUpgradeImplCopyWithImpl<_$DownloadingUpgradeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return downloadingUpgrade(percent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return downloadingUpgrade?.call(percent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (downloadingUpgrade != null) {
      return downloadingUpgrade(percent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return downloadingUpgrade(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return downloadingUpgrade?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (downloadingUpgrade != null) {
      return downloadingUpgrade(this);
    }
    return orElse();
  }
}

abstract class DownloadingUpgrade implements PlatformUpgradeState {
  const factory DownloadingUpgrade(final int percent) =
      _$DownloadingUpgradeImpl;

  int get percent;
  @JsonKey(ignore: true)
  _$$DownloadingUpgradeImplCopyWith<_$DownloadingUpgradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadingUpgradeCompletedImplCopyWith<$Res> {
  factory _$$DownloadingUpgradeCompletedImplCopyWith(
          _$DownloadingUpgradeCompletedImpl value,
          $Res Function(_$DownloadingUpgradeCompletedImpl) then) =
      __$$DownloadingUpgradeCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadingUpgradeCompletedImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res,
        _$DownloadingUpgradeCompletedImpl>
    implements _$$DownloadingUpgradeCompletedImplCopyWith<$Res> {
  __$$DownloadingUpgradeCompletedImplCopyWithImpl(
      _$DownloadingUpgradeCompletedImpl _value,
      $Res Function(_$DownloadingUpgradeCompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadingUpgradeCompletedImpl implements DownloadingUpgradeCompleted {
  const _$DownloadingUpgradeCompletedImpl();

  @override
  String toString() {
    return 'PlatformUpgradeState.downloadingUpgradeCompleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadingUpgradeCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return downloadingUpgradeCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return downloadingUpgradeCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (downloadingUpgradeCompleted != null) {
      return downloadingUpgradeCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return downloadingUpgradeCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return downloadingUpgradeCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (downloadingUpgradeCompleted != null) {
      return downloadingUpgradeCompleted(this);
    }
    return orElse();
  }
}

abstract class DownloadingUpgradeCompleted implements PlatformUpgradeState {
  const factory DownloadingUpgradeCompleted() =
      _$DownloadingUpgradeCompletedImpl;
}

/// @nodoc
abstract class _$$UpgradeSuccessImplCopyWith<$Res> {
  factory _$$UpgradeSuccessImplCopyWith(_$UpgradeSuccessImpl value,
          $Res Function(_$UpgradeSuccessImpl) then) =
      __$$UpgradeSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpgradeSuccessImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$UpgradeSuccessImpl>
    implements _$$UpgradeSuccessImplCopyWith<$Res> {
  __$$UpgradeSuccessImplCopyWithImpl(
      _$UpgradeSuccessImpl _value, $Res Function(_$UpgradeSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpgradeSuccessImpl implements UpgradeSuccess {
  const _$UpgradeSuccessImpl();

  @override
  String toString() {
    return 'PlatformUpgradeState.upgradeSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpgradeSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return upgradeSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return upgradeSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (upgradeSuccess != null) {
      return upgradeSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return upgradeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return upgradeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (upgradeSuccess != null) {
      return upgradeSuccess(this);
    }
    return orElse();
  }
}

abstract class UpgradeSuccess implements PlatformUpgradeState {
  const factory UpgradeSuccess() = _$UpgradeSuccessImpl;
}

/// @nodoc
abstract class _$$UpgradeErrorImplCopyWith<$Res> {
  factory _$$UpgradeErrorImplCopyWith(
          _$UpgradeErrorImpl value, $Res Function(_$UpgradeErrorImpl) then) =
      __$$UpgradeErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$UpgradeErrorImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$UpgradeErrorImpl>
    implements _$$UpgradeErrorImplCopyWith<$Res> {
  __$$UpgradeErrorImplCopyWithImpl(
      _$UpgradeErrorImpl _value, $Res Function(_$UpgradeErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$UpgradeErrorImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpgradeErrorImpl implements UpgradeError {
  const _$UpgradeErrorImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'PlatformUpgradeState.upgradeError(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpgradeErrorImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpgradeErrorImplCopyWith<_$UpgradeErrorImpl> get copyWith =>
      __$$UpgradeErrorImplCopyWithImpl<_$UpgradeErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return upgradeError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return upgradeError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (upgradeError != null) {
      return upgradeError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return upgradeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return upgradeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (upgradeError != null) {
      return upgradeError(this);
    }
    return orElse();
  }
}

abstract class UpgradeError implements PlatformUpgradeState {
  const factory UpgradeError(final String err) = _$UpgradeErrorImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$UpgradeErrorImplCopyWith<_$UpgradeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PlatformUpgradeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$ErrorImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'PlatformUpgradeState.error(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noNeedUpgrade,
    required TResult Function() upgradeAvailable,
    required TResult Function(int percent) downloadingUpgrade,
    required TResult Function() downloadingUpgradeCompleted,
    required TResult Function() upgradeSuccess,
    required TResult Function(String err) upgradeError,
    required TResult Function(String err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noNeedUpgrade,
    TResult? Function()? upgradeAvailable,
    TResult? Function(int percent)? downloadingUpgrade,
    TResult? Function()? downloadingUpgradeCompleted,
    TResult? Function()? upgradeSuccess,
    TResult? Function(String err)? upgradeError,
    TResult? Function(String err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noNeedUpgrade,
    TResult Function()? upgradeAvailable,
    TResult Function(int percent)? downloadingUpgrade,
    TResult Function()? downloadingUpgradeCompleted,
    TResult Function()? upgradeSuccess,
    TResult Function(String err)? upgradeError,
    TResult Function(String err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(NoNeedUpgrade value) noNeedUpgrade,
    required TResult Function(UpgradeAvailable value) upgradeAvailable,
    required TResult Function(DownloadingUpgrade value) downloadingUpgrade,
    required TResult Function(DownloadingUpgradeCompleted value)
        downloadingUpgradeCompleted,
    required TResult Function(UpgradeSuccess value) upgradeSuccess,
    required TResult Function(UpgradeError value) upgradeError,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult? Function(UpgradeAvailable value)? upgradeAvailable,
    TResult? Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult? Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult? Function(UpgradeSuccess value)? upgradeSuccess,
    TResult? Function(UpgradeError value)? upgradeError,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(NoNeedUpgrade value)? noNeedUpgrade,
    TResult Function(UpgradeAvailable value)? upgradeAvailable,
    TResult Function(DownloadingUpgrade value)? downloadingUpgrade,
    TResult Function(DownloadingUpgradeCompleted value)?
        downloadingUpgradeCompleted,
    TResult Function(UpgradeSuccess value)? upgradeSuccess,
    TResult Function(UpgradeError value)? upgradeError,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements PlatformUpgradeState {
  const factory Error(final String err) = _$ErrorImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
