import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';

import '../../../service/merchant_service.dart';
import 'merchant_make_order_state.dart';

class MerchantMakeOrderCubit extends Cubit<MerchantMakeOrderState> {
  MerchantMakeOrderCubit(this._service) : super(const MerchantMakeOrderState());

  final MerchantService _service;

  void setVehicle(int? id) => emit(state.copyWith(vehicleId: id));

  /// Order total = price + shipping price ('' while either isn't a number).
  static String total(String price, String shipPrice) {
    final a = int.tryParse(price.trim());
    final b = int.tryParse(shipPrice.trim());
    return a == null || b == null ? '' : '${a + b}';
  }

  Future<void> createOrder({
    required String to,
    required String name,
    required String phone,
    required String description,
    required String price,
    required String shipPrice,
  }) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.createOrder({
      'to': to,
      'phone': phone,
      'vehicle_id': state.vehicleId,
      'name': name,
      'description': description,
      'price': price,
      'ship_price': shipPrice,
      'total': total(price, shipPrice),
    });
    // The API reports success with `status` 200 / 201 in the body.
    final bodyStatus = res.data?['status'];
    final ok = res.success && (bodyStatus == 200 || bodyStatus == 201);
    emit(
      state.copyWith(
        status: ok ? RequestState.done : RequestState.error,
        msg: res.msg,
        errorType: res.errType,
      ),
    );
  }
}
