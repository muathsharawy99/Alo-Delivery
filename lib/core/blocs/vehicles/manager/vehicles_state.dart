import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:alo_delivery/core/shared/models/vehicle_model.dart';
import 'package:equatable/equatable.dart';

class VehiclesState extends Equatable {
  const VehiclesState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.vehicles = const [],
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final List<VehicleModel> vehicles;

  VehiclesState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    List<VehicleModel>? vehicles,
  }) => VehiclesState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    vehicles: vehicles ?? this.vehicles,
  );

  @override
  List<Object?> get props => [status, msg, errorType, vehicles];
}
