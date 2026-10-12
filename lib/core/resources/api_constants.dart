/// Endpoint paths, relative to [baseUrl].
class ApiConstants {
  /// Alo Delivery has no Firebase project, so the base url is fixed here
  /// instead of being read from Firebase RTDB.
  static const String baseUrl = 'https://alodeliveryegypt.com/api';

  // ── Auth
  static const String clientRegister = 'client/Register';
  static const String deliveryRegister = 'delivery/Register';
  static const String merchantRegister = 'merchant/Register';
  static const String clientLogin = 'client/Login';
  static const String deliveryLogin = 'delivery/Login';
  static const String merchantLogin = 'merchant/Login';

  // ── Vehicles
  static const String vehicles = 'vehicle/get';

  // ── Client
  static const String clientCreateOrder = 'order/insert';
  static const String clientOrders = 'price_offer/get';

  // ── Delivery
  static const String deliveryOrders = 'order/get';
  static const String deliveryAddOffer = 'price_offer/insert';

  // ── Merchant
  static const String merchantCreateOrder = 'merchant/order/store';
}
