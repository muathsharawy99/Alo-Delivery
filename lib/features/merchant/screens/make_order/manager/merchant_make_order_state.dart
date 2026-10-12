import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

class MerchantMakeOrderState extends Equatable {
  const MerchantMakeOrderState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.vehicleId,
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final int? vehicleId;

  MerchantMakeOrderState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    int? vehicleId,
  }) => MerchantMakeOrderState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    vehicleId: vehicleId ?? this.vehicleId,
  );

  @override
  List<Object?> get props => [status, msg, errorType, vehicleId];
}
