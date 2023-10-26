import 'package:alo_delivery/view_model/bloc/merchant_cubit/merchant_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/vehicle_model.dart';
import '../../../view/components/my_customization_widget/custom_toast.dart';
import '../../local/secure_storage/secure_keys.dart';
import '../../local/secure_storage/secure_storage.dart';
import '../../network/dio_helper/dio_helper.dart';
import '../../network/dio_helper/end_points.dart';

class MerchantCubit extends Cubit<MerchantState> {
  MerchantCubit() : super(MerchantInit());

  static MerchantCubit get(context) => BlocProvider.of<MerchantCubit>(context);
  var merchantMakeOrderFormKey = GlobalKey<FormState>();

  AllVehiclesModel? allVehiclesModel;


  TextEditingController toController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController shipPriceController = TextEditingController();
  TextEditingController totalController = TextEditingController();


  getVehicles() {
    emit(GetVehiclesLoadingState());
    DioHelper.get(
      endPoint: EndPoints.getAllVehicles,
    ).then(
          (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          debugPrint("Success On .Then In Get All Vehicles");
          allVehiclesModel = AllVehiclesModel.fromJson(value.data);
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(GetVehiclesSuccessState());
        } else {
          debugPrint("Fail On .Then In Get All Vehicles");
          emit(GetVehiclesErrorState());
          throw 'Error On .Then In Get All Vehicles';
        }
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Get All Vehicles");
      print(error.toString());
      emit(GetVehiclesErrorState());
    });
  }







  void setVehicleController(int value) {
    vehicleController.text = value.toString();
    emit(SetVehicleState());
  }






  storeNewOrder() async {
    print(await SecureStorage.getData(SecureKeys.token));
    emit(MerchantCreateOrderLoadingState());
    DioHelper.post(
      endPoint: EndPoints.merchantCreateOrder,
      token: await SecureStorage.getData(SecureKeys.token),
      data: {
        "type": "merchant",
        "to": toController.text,
        "phone": phoneController.text,
        "vehicle_id": int.parse(vehicleController.text),
        "name": nameController.text,
        "description": descriptionController.text,
        "price": priceController.text,
        "ship_price": shipPriceController.text,
        "total": totalController.text,
      },

      ///TODO : Theeeeeeeeen $ catch Error
    ).then(
      (value) {
        if (value.data['status'] == 200 || value.data['status'] == 201) {
          debugPrint("Success On .Then In Merchant Store New Order");
          showToast(
            msg: value.data['message'],
            isError: false,
          );
          emit(MerchantCreateOrderSuccessState());
        } else {
          debugPrint("Fail On .Then In Merchant Store New Order");
          emit(MerchantCreateOrderErrorState());
          throw 'Error On .Then In Merchant Store New Order';
        }
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Merchant Store New Order");
      print(error.toString());
      if (error is DioException && error.response?.statusCode == 422) {
        final data = error.response?.data;

        final message = data['message'];
        print(message);

        // final errors = error.response?.data['error'];
        // showToast(
        //   msg: "${errors['national_id'][0]}&${errors['phone'][0]}",
        //   isError: true,
        // );
        emit(MerchantCreateOrderErrorState());
      }
    });
  }

















}
