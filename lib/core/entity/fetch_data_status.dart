import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_data_status.freezed.dart';

@freezed
class FetchDataStatus with _$FetchDataStatus {
  const FetchDataStatus._();

  const factory FetchDataStatus.idle() = _Idle;

  const factory FetchDataStatus.loading() = _FetchDataStatusLoading;

  const factory FetchDataStatus.success() = _FetchDataStatusSuccess;

  const factory FetchDataStatus.error() = _FetchDataStatusError;

  bool get isLoading => this == const FetchDataStatus.loading();

  bool get isError => this == const FetchDataStatus.error();

  bool get isSuccess => this == const FetchDataStatus.success();
}
