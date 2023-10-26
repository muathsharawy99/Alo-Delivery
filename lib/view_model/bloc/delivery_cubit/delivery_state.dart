abstract class DeliveryState {}

class DeliveryInitial extends DeliveryState {}


class InitControllerState extends DeliveryState {}




class DeliveryGetAllOrdersLoadingState extends DeliveryState {}
class DeliveryGetAllOrdersSuccessState extends DeliveryState {}
class DeliveryGetAllOrdersErrorState extends DeliveryState {}


class DeliveryAddOfferPriceLoadingState extends DeliveryState {}
class DeliveryAddOfferPriceSuccessState extends DeliveryState {}
class DeliveryAddOfferPriceErrorState extends DeliveryState {}
