import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';

import '../../../data/models/delivery_order_model.dart';
import '../../../service/delivery_service.dart';
import 'delivery_orders_state.dart';

class DeliveryOrdersCubit extends Cubit<DeliveryOrdersState> {
  DeliveryOrdersCubit(this._service) : super(const DeliveryOrdersState());

  final DeliveryService _service;

  Future<void> getOrders() async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.getOrders();
    if (!res.success) {
      emit(
        state.copyWith(
          status: RequestState.error,
          msg: res.msg,
          errorType: res.errType,
        ),
      );
      return;
    }
    final raw = res.data?['data'];
    final orders = [
      if (raw is List)
        for (final e in raw)
          if (e is Map)
            DeliveryOrderModel.fromJson(Map<String, dynamic>.from(e)),
    ];
    emit(
      state.copyWith(
        status: orders.isEmpty ? RequestState.empty : RequestState.done,
        orders: orders,
      ),
    );
  }
}
