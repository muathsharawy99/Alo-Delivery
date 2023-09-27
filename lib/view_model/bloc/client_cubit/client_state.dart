abstract class ClientState {}

class ClientInitial extends ClientState {}
class SetVehicleState extends ClientState {}



class GetFromGallerySuccessState extends ClientState {}
class GetFromGalleryLoadingState extends ClientState {}
class GetFromGalleryErrorState extends ClientState {}




class UserCreateOrderSuccessState extends ClientState {}
class UserCreateOrderLoadingState extends ClientState {}
class UserCreateOrderErrorState extends ClientState {}



class GetVehiclesLoadingState extends ClientState {}
class GetVehiclesSuccessState extends ClientState {}
class GetVehiclesErrorState extends ClientState {}
