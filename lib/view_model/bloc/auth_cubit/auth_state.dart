abstract class AuthState {}

class AuthInitial extends AuthState {}

class ShowRegisterPasswordState extends AuthState {}

class ShowLoginPasswordState extends AuthState {}

class CheckLicencesState extends AuthState {}

class ChangeIndicatorIndexState extends AuthState {}

class SetGenderState extends AuthState {}

class SetVehicleState extends AuthState {}

class ClearImageState extends AuthState {}


class ClearControllerState extends AuthState {}



class GetFromGalleryLoadingState extends AuthState {}
class GetFromGallerySuccessState extends AuthState {}
class GetFromGalleryErrorState extends AuthState {}



class CreateClientLoadingState extends AuthState {}
class CreateClientSuccessState extends AuthState {}
class CreateClientErrorState extends AuthState {}




class CreateDeliveryLoadingState extends AuthState {}
class CreateDeliverySuccessState extends AuthState {}
class CreateDeliveryErrorState extends AuthState {}



class CreateMerchantLoadingState extends AuthState {}
class CreateMerchantSuccessState extends AuthState {}
class CreateMerchantErrorState extends AuthState {}



class LoginClientLoadingState extends AuthState {}
class LoginClientSuccessState extends AuthState {}
class LoginClientPendingState extends AuthState {}
class LoginClientErrorState extends AuthState {}



class LoginDeliveryLoadingState extends AuthState {}
class LoginDeliverySuccessState extends AuthState {}
class LoginDeliveryPendingState extends AuthState {}
class LoginDeliveryErrorState extends AuthState {}




class LoginMerchantLoadingState extends AuthState {}
class LoginMerchantSuccessState extends AuthState {}
class LoginMerchantPendingState extends AuthState {}
class LoginMerchantErrorState extends AuthState {}



class GetVehiclesLoadingState extends AuthState {}
class GetVehiclesSuccessState extends AuthState {}
class GetVehiclesErrorState extends AuthState {}
