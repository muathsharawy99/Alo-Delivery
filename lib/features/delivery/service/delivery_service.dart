import 'package:alo_delivery/core/resources/api_constants.dart';
import 'package:alo_delivery/core/services/server_gate.dart';

class DeliveryService {
  Future<CustomResponse<Map<String, dynamic>>> getOrders() =>
      ServerGate.i.getFromServer<Map<String, dynamic>>(
        url: ApiConstants.deliveryOrders,
      );

  Future<CustomResponse<Map<String, dynamic>>> addOffer({
    required int orderId,
    required int price,
  }) => ServerGate.i.sendToServer<Map<String, dynamic>>(
    url: ApiConstants.deliveryAddOffer,
    body: {'price': price, 'order_id': orderId},
  );
}
