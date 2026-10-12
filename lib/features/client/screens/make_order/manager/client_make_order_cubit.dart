import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:alo_delivery/core/utils/app_image_picker.dart';

import '../../../service/client_service.dart';
import 'client_make_order_state.dart';

class ClientMakeOrderCubit extends Cubit<ClientMakeOrderState> {
  ClientMakeOrderCubit(this._service) : super(const ClientMakeOrderState());

  final ClientService _service;

  Future<void> pickImage() async {
    final file = await AppImagePicker.pickFromGallery();
    if (file != null) emit(state.copyWith(image: file));
  }

  void setVehicle(int? id) => emit(state.copyWith(vehicleId: id));

  Future<void> createOrder({
    required String from,
    required String to,
    required String phone,
    required String description,
  }) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.createOrder({
      'from': from,
      'to': to,
      'phone': phone,
      'description': description,
      'vehicle_id': state.vehicleId,
    }, image: state.image);
    emit(
      state.copyWith(
        status: res.success ? RequestState.done : RequestState.error,
        msg: res.msg,
        errorType: res.errType,
      ),
    );
  }
}
