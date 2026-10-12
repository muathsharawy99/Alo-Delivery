import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';

import '../../../data/models/client_order_model.dart';
import '../../../service/client_service.dart';
import 'client_follow_order_state.dart';

class ClientFollowOrderCubit extends Cubit<ClientFollowOrderState> {
  ClientFollowOrderCubit(this._service) : super(const ClientFollowOrderState());

  final ClientService _service;

  /// The API answers `{data: [{orders: [...]}]}`.
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
    final data = res.data?['data'];
    final first = data is List && data.isNotEmpty ? data.first : null;
    final raw = first is Map ? first['orders'] : null;
    final orders = [
      if (raw is List)
        for (final e in raw)
          if (e is Map) ClientOrderModel.fromJson(Map<String, dynamic>.from(e)),
    ];
    emit(
      state.copyWith(
        status: orders.isEmpty ? RequestState.empty : RequestState.done,
        orders: orders,
      ),
    );
  }
}
