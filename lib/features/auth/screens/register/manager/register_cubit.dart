import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:alo_delivery/core/services/server_gate.dart';
import 'package:alo_delivery/core/utils/app_image_picker.dart';

import '../service/register_service.dart';
import 'register_image.dart';
import 'register_state.dart';

/// Sign up for the three account types (each screen gets its own instance).
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._service) : super(const RegisterState());

  final RegisterService _service;

  void toggleTerms() =>
      emit(state.copyWith(termsAccepted: !state.termsAccepted));

  void setGender(String? gender) => emit(state.copyWith(gender: gender));

  void setVehicle(int? id) => emit(state.copyWith(vehicleId: id));

  Future<void> pickImage(RegisterImage type) async {
    final file = await AppImagePicker.pickFromGallery();
    if (file == null) return;
    emit(
      switch (type) {
        RegisterImage.id => state.copyWith(idImage: file),
        RegisterImage.licence => state.copyWith(licenceImage: file),
        RegisterImage.profile => state.copyWith(profileImage: file),
      },
    );
  }

  Future<void> registerClient({
    required String name,
    required String phone,
    required String nationalId,
    required String email,
    required String password,
    required String confirmPassword,
  }) => _submit(
    () => _service.registerClient({
      'name': name,
      'phone': phone,
      'national_id': nationalId,
      'gender': state.gender,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    }),
  );

  Future<void> registerDelivery({
    required String name,
    required String phone,
    required String nationalId,
    required String email,
    required String password,
  }) => _submit(
    () => _service.registerDelivery(
      {
        'name': name,
        'phone': phone,
        if (email.isNotEmpty) 'email': email,
        'password': password,
        'vehicle_id': state.vehicleId,
        'national_id': nationalId,
      },
      idImage: state.idImage!,
      licenceImage: state.licenceImage!,
      profileImage: state.profileImage!,
    ),
  );

  Future<void> registerMerchant({
    required String company,
    required String phone,
    required String extraPhone,
    required String nationalId,
    required String password,
    required String address,
  }) => _submit(
    () => _service.registerMerchant({
      'company': company,
      'phone': phone,
      'extra_phone': extraPhone,
      'national_id': nationalId,
      'password': password,
      'address': address,
    }),
  );

  Future<void> _submit(
    Future<CustomResponse<Map<String, dynamic>>> Function() request,
  ) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await request();
    emit(
      state.copyWith(
        status: res.success ? RequestState.done : RequestState.error,
        msg: res.msg,
        errorType: res.errType,
      ),
    );
  }
}
