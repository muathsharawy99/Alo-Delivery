import 'dart:io';

import 'package:alo_delivery/core/resources/api_constants.dart';
import 'package:alo_delivery/core/services/server_gate.dart';
import 'package:dio/dio.dart';

class ClientService {
  /// Multipart: the order fields + an optional photo.
  Future<CustomResponse<Map<String, dynamic>>> createOrder(
    Map<String, dynamic> fields, {
    File? image,
  }) async => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.clientCreateOrder,
    formData: FormData.fromMap({
      ...fields,
      if (image != null) 'image': await MultipartFile.fromFile(image.path),
    }),
  );

  Future<CustomResponse<Map<String, dynamic>>> getOrders() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.clientOrders,
      );
}
