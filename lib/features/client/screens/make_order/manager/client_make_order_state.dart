import 'dart:io';

import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

class ClientMakeOrderState extends Equatable {
  const ClientMakeOrderState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.image,
    this.vehicleId,
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final File? image;
  final int? vehicleId;

  ClientMakeOrderState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    File? image,
    int? vehicleId,
  }) => ClientMakeOrderState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    image: image ?? this.image,
    vehicleId: vehicleId ?? this.vehicleId,
  );

  @override
  List<Object?> get props => [status, msg, errorType, image?.path, vehicleId];
}
