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

  createClient() {
    emit(CreateUserLoadingState());
    DioHelper.post(
      endPoint: EndPoints.register,
      data: {
        "name": nameController.text,
        "national_id": nIDController.text,
        "password": passwordController.text,
        "password_confirmation": vPasswordController.text,
        "gender": genderController.text,
        "phone": phoneController.text,
        "type": "client",
        "email": emailController.text,
      },
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Client Register");
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(CreateUserSuccessState());
        } else {
          print("Fail On .Then In Client Register");
          emit(CreateUserErrorState());
          throw 'Error On .Then In Client Register';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Client Register");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final errors = error.response?.data['error'];
        showToast(
          msg: "${errors['national_id'][0]}&${errors['phone'][0]}",
          isError: true,
        );
        emit(CreateUserErrorState());
      }
    });
  }

  ///TODO : Photos
  createDelivery() async {
    emit(CreateDeliveryLoadingState());
    DioHelper.postWithImage(
      endPoint: EndPoints.register,
      data: FormData.fromMap({
        "name": nameController.text,
        "national_id": nIDController.text,
        "password": passwordController.text,
        "password_confirmation": vPasswordController.text,
        "gender": "male",
        "phone": phoneController.text,
        "type": "delivery",
        "email": emailController.text,
        "vehicle_id": int.parse(vehicleController.text),
        "national_front": await MultipartFile.fromFile(
          idImage!.path,
        ),
        // "license_img": licenceImage?.path,
        // "image": profileImage?.path,
      }),
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Delivery Register");
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(CreateDeliverySuccessState());
        } else {
          print("Fail On .Then In Delivery Register");
          emit(CreateDeliveryErrorState());
          throw 'Error On .Then In Delivery Register';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Delivery Register");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final data = error.response?.data;

        final message = data['error'];
        print("HIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
        print(message);

        // final errors = error.response?.data['error'];
        // showToast(
        //   msg: "${errors['national_id'][0]}&${errors['phone'][0]}",
        //   isError: true,
        // );
        emit(CreateDeliveryErrorState());
      }
    });
  }

  ///TODO : Test
  createMerchant() {
    emit(CreateMerchantLoadingState());
    DioHelper.post(
      endPoint: EndPoints.register,
      data: {
        "national_id": nIDController.text,
        "password": passwordController.text,
        "password_confirmation": vPasswordController.text,
        "phone": phoneController.text,
        "type": "merchant",
        "company_name": nameController.text,
        "extra_phone": additionalPhoneController.text,
        "address": addressController.text,
      },
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Client Register");
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(CreateMerchantSuccessState());
        } else {
          print("Fail On .Then In Client Register");
          emit(CreateMerchantErrorState());
          throw 'Error On .Then In Client Register';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Client Register");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final errors = error.response?.data['error'];
        showToast(
          msg: "${errors['national_id'][0]}&${errors['phone'][0]}",
          isError: true,
        );
        emit(CreateMerchantErrorState());
      }
    });
  }


  loginClient() {
    emit(LoginUserLoadingState());
    DioHelper.post(
      endPoint: EndPoints.login,
      data: {
        "national_id": nIDController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) async {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Client Login");
          if (value.data['message'] == ConstKeys.pending) {
            emit(LoginUserPendingState());
          } else if (value.data['message'] == ConstKeys.rejected) {
            emit(LoginUserRejectedState());
          } else if (value.data['message'] == ConstKeys.accepted) {
            showToast(
              msg: value.data['message'],
              isError: false,
            );
            SecureStorage.setData(
              SecureKeys.token,
              value.data['data']['token'],
            );
            emit(LoginUserSuccessState());
          }
        } else {
          print("Fail On .Then In Client Login");
          emit(LoginUserErrorState());
          throw 'Error On .Then In Client Login';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Client Login");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final response = error.response?.data;
        showToast(
          msg: "${response['message']}",
          isError: true,
        );
        emit(LoginUserErrorState());
      }
    });
  }

  ///TODO : Test
  loginDelivery() {
    emit(LoginDeliveryLoadingState());
    DioHelper.post(
      endPoint: EndPoints.login,
      data: {
        "national_id": nIDController.text,
        "password": passwordController.text,
      },
    ).then(
          (value) async {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Delivery Login");
          if (value.data['message'] == ConstKeys.pending) {
            emit(LoginDeliveryPendingState());
          } else if (value.data['message'] == ConstKeys.rejected) {
            emit(LoginDeliveryRejectedState());
          } else if (value.data['message'] == ConstKeys.accepted) {
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
        } else {
          print("Fail On .Then In Delivery Login");
          emit(LoginDeliveryErrorState());
          throw 'Error On .Then In Delivery Login';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Delivery Login");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final response = error.response?.data;
        showToast(
          msg: "${response['message']}",
          isError: true,
        );
        emit(LoginDeliveryErrorState());
      }
    });
  }

  ///TODO : Test
  loginMerchant() {
    emit(LoginMerchantLoadingState());
    DioHelper.post(
      endPoint: EndPoints.login,
      data: {
        "national_id": nIDController.text,
        "password": passwordController.text,
      },
    ).then(
          (value) async {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Delivery Login");
          if (value.data['message'] == ConstKeys.pending) {
            emit(LoginMerchantPendingState());
          } else if (value.data['message'] == ConstKeys.rejected) {
            emit(LoginMerchantRejectedState());
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
        } else {
          print("Fail On .Then In Delivery Login");
          emit(LoginMerchantErrorState());
          throw 'Error On .Then In Delivery Login';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Delivery Login");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final response = error.response?.data;
        showToast(
          msg: "${response['message']}",
          isError: true,
        );
        emit(LoginMerchantErrorState());
      }
    });
  }


  getVehicles() {
    emit(GetVehiclesLoadingState());
    DioHelper.get(
      endPoint: EndPoints.getAllVehicles,
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Get All Vehicles");
          allVehiclesModel = AllVehiclesModel.fromJson(value.data);
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(GetVehiclesSuccessState());
        } else {
          print("Fail On .Then In Get All Vehicles");
          emit(GetVehiclesErrorState());
          throw 'Error On .Then In Get All Vehicles';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Get All Vehicles");
      print(error.toString());
      emit(GetVehiclesErrorState());
    });
  }

}
