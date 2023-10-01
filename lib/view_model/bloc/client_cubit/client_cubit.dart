import 'dart:convert';
import 'dart:io';
import 'package:alo_delivery/model/offers_model.dart';
import 'package:alo_delivery/view/components/app_customs/follow_order_container/follow_order_container.dart';
import 'package:alo_delivery/view_model/bloc/client_cubit/client_state.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_keys.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_storage.dart';
import 'package:alo_delivery/view_model/network/dio_helper/dio_helper.dart';
import 'package:alo_delivery/view_model/network/dio_helper/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/all_orders_model.dart';
import '../../../model/vehicle_model.dart';
import '../../../view/components/my_customization_widget/custom_toast.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(ClientInitial());

  static ClientCubit get(context) => BlocProvider.of<ClientCubit>(context);

  var newOrderFormKey = GlobalKey<FormState>();

  File? imageFile;

  AllVehiclesModel? allVehiclesModel;
  AllOrdersModel? allOrdersModel;

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
    emit(ClearControllerState());
  }

  bool visible = false;

  changeVisibility(int index) {
    visible = !visible;
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
          print("Success On .Then In Client Store New Order");
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(UserCreateOrderSuccessState());
        } else {
          print("Fail On .Then In Client Store New Order");
          emit(UserCreateOrderErrorState());
          throw 'Error On .Then In Client Store New Order';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Client Store New Order");
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

//TODO : By Time
//   Stream<OfferModel> getAllOffers() async* {
//     OfferModel? offerModel;
//     final response = await Dio().get<ResponseBody>(
//       "${EndPoints.baseUrl}${EndPoints.clientGetAllOffers}",
//       options: Options(responseType: ResponseType.stream, headers: {
//         "Content-type": "application/json",
//         "Accept": "application/json",
//         "Authorization":
//             "Bearer ${await SecureStorage.getData(SecureKeys.token)}"
//       }),
//     );
//
//     // Process the response stream and yield the chunks
//     final stream = response.data!.stream;
//     final buffer = <int>[];
//     await for (final chunk in stream) {
//       buffer.addAll(chunk);
//       try {
//         final jsonString = utf8.decode(buffer);
//         final dynamic jsonMap = json.decode(jsonString);
//
//         // Parse the JSON map into a model
//         final newModel = OfferModel.fromJson(jsonMap);
//
//         // Assign the new model to the result
//         offerModel = newModel;
//
//         // Clear the buffer for the next chunk
//         buffer.clear();
//       } catch (e) {
//         // Handle JSON parsing errors or other exceptions
//         print('Error parsing JSON: $e');
//       }
//
//       if (offerModel != null) {
//         print("offer Model :$offerModel");
//         yield offerModel;
//         print("hello");
//       } else {
//         print("null");
//       }
//     }
//   }

  Stream<OfferModel> getAllOffers() async* {
    emit(GetAllOffersLoadingState());
    final dio = Dio();
    try {
      final response = await dio.get(
        "${EndPoints.baseUrl}${EndPoints.clientGetAllOffers}",
        options: Options(responseType: ResponseType.stream, headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "Authorization":
          "Bearer ${await SecureStorage.getData(SecureKeys.token)}"
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonDataList = response.data;
        for (var jsonData in jsonDataList) {
          yield OfferModel.fromJson(jsonData);
          emit(GetAllOffersSuccessState());
        }
      } else {
        emit(GetAllOffersErrorState());
        throw Exception('Failed to load data');
      }
    } catch (e) {
      emit(GetAllOffersErrorState());
      throw Exception('Failed to load data: $e');
    }
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

  getAllOrders() async {
    emit(GetAllOrdersLoadingState());
    DioHelper.get(
      endPoint: EndPoints.clientGetAllOrders,
      token: await SecureStorage.getData(SecureKeys.token),
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          print("Success On .Then In Get All Orders");
          allOrdersModel = AllOrdersModel.fromJson(value.data);
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(GetAllOrdersSuccessState());
        } else {
          print("Fail On .Then In Get All Orders");
          emit(GetAllOrdersErrorState());
          throw 'Error On .Then In Get All Orders';
        }
      },
    ).catchError((error) {
      print("Error On .CatchError In Get All Orders");
      print(error.toString());
      emit(GetAllOrdersErrorState());
    });
  }
}
