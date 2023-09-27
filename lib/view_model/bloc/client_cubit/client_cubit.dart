import 'dart:io';
import 'package:alo_delivery/view_model/bloc/client_cubit/client_state.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_keys.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_storage.dart';
import 'package:alo_delivery/view_model/network/dio_helper/dio_helper.dart';
import 'package:alo_delivery/view_model/network/dio_helper/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/vehicle_model.dart';
import '../../../view/components/my_customization_widget/custom_toast.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());

  static ClientCubit get(context) => BlocProvider.of<ClientCubit>(context);

  var newOrderFormKey = GlobalKey<FormState>();

  File? imageFile;

  AllVehiclesModel? allVehiclesModel;

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void setVehicleController(int value) {
    vehicleController.text = value.toString();
    emit(SetVehicleState());
  }

  getFromGallery() async {
    // image of client new order
    emit(GetFromGalleryLoadingState());
    XFile? pickedImage = await ImagePicker()
        .pickImage(
      source: ImageSource.gallery,
    )
        .catchError(
      (onError) {
        emit(GetFromGalleryErrorState());
        return onError;
      },
    );

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      emit(GetFromGallerySuccessState());
    }
  }

  void clearController() {
    fromController.clear();
    toController.clear();
    phoneController.clear();
    vehicleController.clear();
    descriptionController.clear();

  }

  storeNewOrder() async {
    print(await SecureStorage.getData(SecureKeys.token));
    emit(UserCreateOrderLoadingState());
    DioHelper.postWithImage(
      endPoint: EndPoints.clientCreateOrder,
      token: await SecureStorage.getData(SecureKeys.token),
      data: FormData.fromMap({
        "from": fromController.text,
        "to": toController.text,
        "phone": phoneController.text,
        "vehicle_id": int.parse(vehicleController.text),
        "type": "client",
        "description": descriptionController.text,
        "image": await MultipartFile.fromFile(
          imageFile!.path,
        ),
      }),
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Client Store New Delivery");
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(UserCreateOrderSuccessState());
        } else {
          print("Fail On .Then In Client Store New Delivery");
          emit(UserCreateOrderErrorState());
          throw 'Error On .Then In Client Store New Delivery';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Client Store New Delivery");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 401) {
        final data = error.response?.data;

        final message = data['message'];
        print(message);

        // final errors = error.response?.data['error'];
        // showToast(
        //   msg: "${errors['national_id'][0]}&${errors['phone'][0]}",
        //   isError: true,
        // );
        emit(UserCreateOrderErrorState());
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
