import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/delivery_order_model.dart';

class DeliveryOrdersState extends Equatable {
  const DeliveryOrdersState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.orders = const [],
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final List<DeliveryOrderModel> orders;

  DeliveryOrdersState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    List<DeliveryOrderModel>? orders,
  }) => DeliveryOrdersState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    orders: orders ?? this.orders,
  );

  @override
  List<Object?> get props => [status, msg, errorType, orders];
}
