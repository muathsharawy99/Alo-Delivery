import 'package:alo_delivery/core/blocs/safe_cubit.dart';
import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:alo_delivery/core/resources/app_constants.dart';
import 'package:alo_delivery/core/shared/enums/user_type.dart';
import 'package:alo_delivery/core/shared/models/user_model.dart';

import '../service/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._service) : super(const LoginState());

  final LoginService _service;

  Future<void> login({
    required UserType type,
    required String phone,
    required String password,
  }) async {
    emit(state.copyWith(status: RequestState.loading, msg: ''));
    final res = await _service.login(
      type: type,
      phone: phone,
      password: password,
    );
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

    final message = '${res.data?['message'] ?? ''}';
    final raw = res.data?['data'];
    final user = raw is Map ? Map<String, dynamic>.from(raw) : <String, dynamic>{};

    if (message == AppConstants.pendingMessage) {
      emit(state.copyWith(status: RequestState.done, isPending: true));
      return;
    }

    // Merchants are accepted by the message, clients / couriers by status.
    final accepted = type.isMerchant
        ? message == AppConstants.acceptedStatus
        : user['status'] == AppConstants.acceptedStatus;
    if (!accepted) {
      emit(state.copyWith(status: RequestState.initial));
      return;
    }

    UserModel.i.fromJson({...user, 'type': type.name});
    await UserModel.i.save();
    emit(
      state.copyWith(status: RequestState.done, isPending: false, msg: message),
    );
  }
}
