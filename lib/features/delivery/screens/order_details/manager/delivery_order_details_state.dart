import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

class DeliveryOrderDetailsState extends Equatable {
  const DeliveryOrderDetailsState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
  });

  /// Status of sending the price offer.
  final RequestState status;
  final String msg;
  final ErrorType errorType;

  DeliveryOrderDetailsState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
  }) => DeliveryOrderDetailsState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
  );

  @override
  List<Object?> get props => [status, msg, errorType];
}
