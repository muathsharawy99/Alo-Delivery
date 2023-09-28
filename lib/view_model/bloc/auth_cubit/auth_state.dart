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



class CreateUserLoadingState extends AuthState {}
class CreateUserSuccessState extends AuthState {}
class CreateUserErrorState extends AuthState {}




class CreateDeliveryLoadingState extends AuthState {}
class CreateDeliverySuccessState extends AuthState {}
class CreateDeliveryErrorState extends AuthState {}



class CreateMerchantLoadingState extends AuthState {}
class CreateMerchantSuccessState extends AuthState {}
class CreateMerchantErrorState extends AuthState {}



class LoginUserLoadingState extends AuthState {}
class LoginUserSuccessState extends AuthState {}
class LoginUserPendingState extends AuthState {}
class LoginUserRejectedState extends AuthState {}
class LoginUserErrorState extends AuthState {}



class LoginDeliveryLoadingState extends AuthState {}
class LoginDeliverySuccessState extends AuthState {}
class LoginDeliveryPendingState extends AuthState {}
class LoginDeliveryRejectedState extends AuthState {}
class LoginDeliveryErrorState extends AuthState {}




class LoginMerchantLoadingState extends AuthState {}
class LoginMerchantSuccessState extends AuthState {}
class LoginMerchantPendingState extends AuthState {}
class LoginMerchantRejectedState extends AuthState {}
class LoginMerchantErrorState extends AuthState {}



class GetVehiclesLoadingState extends AuthState {}
class GetVehiclesSuccessState extends AuthState {}
class GetVehiclesErrorState extends AuthState {}
