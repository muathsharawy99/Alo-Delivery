import 'dart:io';

import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:alo_delivery/view/components/texts/keys.dart';
import 'package:alo_delivery/view_model/bloc/auth_cubit/auth_state.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_keys.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/vehicle_model.dart';
import '../../network/dio_helper/dio_helper.dart';
import '../../network/dio_helper/end_points.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  bool isRegisterVisible = false;
  bool isLoginVisible = false;
  int currentIndex = 0;
  bool isChecked = false;

  var registerFormKey = GlobalKey<FormState>();
  var loginFormKey = GlobalKey<FormState>();

  AllVehiclesModel? allVehiclesModel;

  File? idImage;
  File? licenceImage;
  File? profileImage;
  XFile? selectedImage;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController additionalPhoneController = TextEditingController();
  TextEditingController nIDController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController vPasswordController = TextEditingController();

  void showRegisterPassword() {
    isRegisterVisible = !isRegisterVisible;
    emit(ShowRegisterPasswordState());
  }

  void showLoginPassword() {
    isLoginVisible = !isLoginVisible;
    emit(ShowLoginPasswordState());
  }

  void checkLicences() {
    isChecked = !isChecked;
    emit(CheckLicencesState());
  }

  void changeIndicatorIndex(int index) {
    currentIndex = index;
    emit(ChangeIndicatorIndexState());
  }

  void setGenderController(String value) {
    genderController.text = value;
    emit(SetGenderState());
  }

  void setVehicleController(int value) {
    vehicleController.text = value.toString();
    emit(SetVehicleState());
  }

  void clearController() {
    nameController.clear();
    phoneController.clear();
    nIDController.clear();
    genderController.clear();
    vehicleController.clear();
    emailController.clear();
    passwordController.clear();
    vPasswordController.clear();
    emit(ClearControllerState());
  }

  getFromGallery(String type) async {
    emit(GetFromGalleryLoadingState());
    selectedImage = await ImagePicker()
        .pickImage(
      source: ImageSource.gallery,
    )
        .catchError(
      (onError) {
        emit(GetFromGalleryErrorState());
        return onError;
      },
    );
    if (selectedImage != null) {
      if (type == "ID") {
        idImage = File(selectedImage!.path);
      } else if (type == "Licence") {
        licenceImage = File(selectedImage!.path);
      } else if (type == "Profile") {
        profileImage = File(selectedImage!.path);
      }
      emit(GetFromGallerySuccessState());
    }
  }

  void clearImages() {
    idImage = null;
    licenceImage = null;
    profileImage = null;
    emit(ClearImageState());
  }

  //DONE
  createClient() {
    emit(CreateClientLoadingState());
    DioHelper.post(
      endPoint: EndPoints.clientRegister,
      data: {
        "name": nameController.text,
        "phone": phoneController.text,
        "national_id": nIDController.text,
        "gender": genderController.text,
        if (emailController.text != "") "email": emailController.text,
        "password": passwordController.text,
        "confirm_password": vPasswordController.text,
      },
    ).then(
      (value) {
        debugPrint("Success On .Then In Client Register");
        showToast(
          msg: value.data['message'],
          isError: false,
        );
        emit(CreateClientSuccessState());
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Client Register");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final errors = error.response?.data['message'];
        debugPrint("4222222");
        showToast(
          msg: "${errors}",
          isError: true,
        );
        emit(CreateClientErrorState());
      } else {
        showToast(
          msg: "${error.response?.data['error']}",
          isError: true,
        );
        emit(CreateClientErrorState());
      }
    });
  }

  //DONE
  createDelivery() async {
    emit(CreateDeliveryLoadingState());
    DioHelper.postWithImage(
      endPoint: EndPoints.deliveryRegister,
      data: FormData.fromMap(
        {
          "name": nameController.text,
          "phone": phoneController.text,
          if (emailController.text != "") "email": emailController.text,
          "password": passwordController.text,
          "card_image": await MultipartFile.fromFile(
            idImage!.path,
          ),
          "license_image": await MultipartFile.fromFile(
            licenceImage!.path,
          ),
          "image": await MultipartFile.fromFile(
            profileImage!.path,
          ),
          "vehicle_id": int.parse(vehicleController.text),
          "national_id": nIDController.text,
        },
      ),
    ).then(
      (value) {
        debugPrint("Success On .Then In Delivery Register");
        showToast(
          msg: value.data['message'],
          isError: false,
        );
        emit(CreateDeliverySuccessState());
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Delivery Register");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final data = error.response?.data;
        final message = data['message'];
        showToast(
          msg: message,
          isError: true,
        );
        emit(CreateDeliveryErrorState());
      } else {
        showToast(
          msg: "${error.response?.data['error']}",
          isError: true,
        );
        emit(CreateDeliveryErrorState());
      }
    });
  }

  //DONE
  createMerchant() {
    emit(CreateMerchantLoadingState());
    DioHelper.post(
      endPoint: EndPoints.merchantRegister,
      data: {
        "company": nameController.text,
        "phone": phoneController.text,
        if (additionalPhoneController.text != "")
          "extra_phone": additionalPhoneController.text,
        "national_id": nIDController.text,
        "password": passwordController.text,
        "address": addressController.text,
      },
    ).then(
      (value) {
        debugPrint("Success On .Then In Merchant Register");
        showToast(
          msg: value.data['message'],
          isError: false,
        );
        emit(CreateMerchantSuccessState());
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Merchant Register");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final message = error.response?.data['message'];
        showToast(
          msg: message,
          isError: true,
        );
        emit(CreateMerchantErrorState());
      } else {
        showToast(
          msg: "${error.response?.data['error']}",
          isError: true,
        );
        emit(CreateMerchantErrorState());
      }
    });
  }

  //DONE
  loginClient() {
    emit(LoginClientLoadingState());
    DioHelper.post(
      endPoint: EndPoints.clientLogin,
      data: {
        "phone": phoneController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) async {
        debugPrint("Success On .Then In Client Login");
        if (value.data['message'] == ConstKeys.pending) {
          emit(LoginClientPendingState());
        } else if (value.data['data']['status'] == ConstKeys.accepted) {
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          SecureStorage.setData(
            SecureKeys.token,
            value.data['data']['token'],
          );
          emit(LoginClientSuccessState());
        }
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Client Login");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final response = error.response?.data;
        showToast(
          msg: response,
          isError: true,
        );
        emit(LoginClientErrorState());
      } else {
        showToast(
          msg: "${error.response?.data['error']}",
          isError: true,
        );
        emit(LoginClientErrorState());
      }
    });
  }

  //DONE
  loginDelivery() {
    emit(LoginDeliveryLoadingState());
    DioHelper.post(
      endPoint: EndPoints.deliveryLogin,
      data: {
        "phone": phoneController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) async {
        debugPrint("Success On .Then In Delivery Login");
        if (value.data['message'] == ConstKeys.pending) {
          emit(LoginDeliveryPendingState());
        } else if (value.data['data']['status'] == ConstKeys.accepted) {
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          SecureStorage.setData(
            SecureKeys.token,
            value.data['data']['token'],
          );
          emit(LoginDeliverySuccessState());
        }
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Delivery Login");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final response = error.response?.data;
        showToast(
          msg: response,
          isError: true,
        );
        emit(LoginDeliveryErrorState());
      } else {
        showToast(
          msg: "${error.response?.data}",
          isError: true,
        );
        emit(LoginDeliveryErrorState());
      }
    });
  }

  //DONE
  loginMerchant() {
    emit(LoginMerchantLoadingState());
    DioHelper.post(
      endPoint: EndPoints.merchantLogin,
      data: {
        "phone": phoneController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) async {
        debugPrint("Success On .Then In Merchant Login");
        if (value.data['message'] == ConstKeys.pending) {
          emit(LoginMerchantPendingState());
        } else if (value.data['message'] == ConstKeys.accepted) {
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          SecureStorage.setData(
            SecureKeys.token,
            value.data['data']['token'],
          );
          emit(LoginMerchantSuccessState());
        }
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Merchant Login");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final response = error.response?.data;
        showToast(
          msg: response,
          isError: true,
        );
        emit(LoginMerchantErrorState());
      } else {
        showToast(
          msg: "${error.response?.data['error']}",
          isError: true,
        );
        emit(LoginMerchantErrorState());
      }
    });
  }

  //DONE
  getVehicles() {
    emit(GetVehiclesLoadingState());
    DioHelper.get(
      endPoint: EndPoints.getAllVehicles,
    ).then(
      (value) {
          debugPrint("Success On .Then In Get All Vehicles");
          allVehiclesModel = AllVehiclesModel.fromJson(value.data);
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(GetVehiclesSuccessState());
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Get All Vehicles");
      print(error.toString());
      emit(GetVehiclesErrorState());
    });
  }
}
