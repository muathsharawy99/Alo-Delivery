import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';

import '../../../service/delivery_service.dart';
import 'delivery_order_details_state.dart';

class DeliveryOrderDetailsCubit extends Cubit<DeliveryOrderDetailsState> {
  DeliveryOrderDetailsCubit(this._service)
    : super(const DeliveryOrderDetailsState());

  final DeliveryService _service;

  Future<void> addOffer({required int orderId, required String price}) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.addOffer(
      orderId: orderId,
      price: int.tryParse(price.trim()) ?? 0,
    );
    emit(
      state.copyWith(
        status: res.success ? RequestState.done : RequestState.error,
        msg: res.msg,
        errorType: res.errType,
      ),
    );
  }
}
