import 'dart:io';

import 'package:alo_delivery/core/resources/api_constants.dart';
import 'package:alo_delivery/core/services/server_gate.dart';
import 'package:dio/dio.dart';

class RegisterService {
  Future<CustomResponse<Map<String, dynamic>>> registerClient(
    Map<String, dynamic> body,
  ) => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.clientRegister,
    body: body,
  );

  /// Multipart: the fields + ID card, vehicle licence and profile images.
  Future<CustomResponse<Map<String, dynamic>>> registerDelivery(
    Map<String, dynamic> fields, {
    required File idImage,
    required File licenceImage,
    required File profileImage,
  }) async => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.deliveryRegister,
    formData: FormData.fromMap({
      ...fields,
      'card_image': await MultipartFile.fromFile(idImage.path),
      'license_image': await MultipartFile.fromFile(licenceImage.path),
      'image': await MultipartFile.fromFile(profileImage.path),
    }),
  );

  Future<CustomResponse<Map<String, dynamic>>> registerMerchant(
    Map<String, dynamic> body,
  ) => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.merchantRegister,
    body: body,
  );
}
