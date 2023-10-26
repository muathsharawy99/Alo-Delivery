abstract class MerchantState {}

class MerchantInit extends MerchantState {}

class SetVehicleState extends MerchantState {}

class MerchantCreateOrderSuccessState extends MerchantState {}
class MerchantCreateOrderLoadingState extends MerchantState {}
class MerchantCreateOrderErrorState extends MerchantState {}


class GetVehiclesLoadingState extends MerchantState {}
class GetVehiclesSuccessState extends MerchantState {}
class GetVehiclesErrorState extends MerchantState {}

