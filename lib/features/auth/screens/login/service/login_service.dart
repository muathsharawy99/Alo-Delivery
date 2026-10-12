import 'package:alo_delivery/core/resources/api_constants.dart';
import 'package:alo_delivery/core/services/server_gate.dart';
import 'package:alo_delivery/core/shared/enums/user_type.dart';

class LoginService {
  Future<CustomResponse<Map<String, dynamic>>> login({
    required UserType type,
    required String phone,
    required String password,
  }) => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: switch (type) {
      UserType.client => ApiConstants.clientLogin,
      UserType.delivery => ApiConstants.deliveryLogin,
      UserType.merchant => ApiConstants.merchantLogin,
    },
    body: {'phone': phone, 'password': password},
  );
}
