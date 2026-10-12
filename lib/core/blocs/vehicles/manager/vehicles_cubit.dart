import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:alo_delivery/core/shared/models/vehicle_model.dart';

import '../service/vehicles_service.dart';
import 'vehicles_state.dart';

/// App-wide vehicle types (register as courier, new client / merchant order).
class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit(this._service) : super(const VehiclesState());

  final VehiclesService _service;

  /// Loads once; later calls reuse the list unless [force].
  Future<void> getVehicles({bool force = false}) async {
    if (!force && (state.status.isLoading || state.vehicles.isNotEmpty)) {
      return;
    }
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getVehicles();
    if (res.success) {
      final raw = res.data?['data'];
      emit(
        state.copyWith(
          status: RequestState.done,
          vehicles: [
            if (raw is List)
              for (final e in raw)
                if (e is Map)
                  VehicleModel.fromJson(Map<String, dynamic>.from(e)),
          ],
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RequestState.error,
          msg: res.msg,
          errorType: res.errType,
        ),
      );
    }
  }
}
