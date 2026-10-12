import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/client_order_model.dart';

class ClientFollowOrderState extends Equatable {
  const ClientFollowOrderState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.orders = const [],
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final List<ClientOrderModel> orders;

  ClientFollowOrderState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    List<ClientOrderModel>? orders,
  }) => ClientFollowOrderState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    orders: orders ?? this.orders,
  );

  @override
  List<Object?> get props => [status, msg, errorType, orders];
}
