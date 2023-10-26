import 'package:alo_delivery/model/delivery_models/delivery_orders_model.dart';
import 'package:alo_delivery/view/components/my_customization_widget/custom_toast.dart';
import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_state.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_keys.dart';
import 'package:alo_delivery/view_model/local/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/dio_helper/dio_helper.dart';
import '../../network/dio_helper/end_points.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(DeliveryInitial());

  static DeliveryCubit get(context) => BlocProvider.of<DeliveryCubit>(context);

  DeliveryOrdersModel? deliveryOrdersModel;

  var deliveryPriceFormKey = GlobalKey<FormState>();

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void initController(int index) {
    fromController.text = deliveryOrdersModel?.data?[index].from ?? "من";
    toController.text = deliveryOrdersModel?.data?[index].to ?? "الي";
    phoneController.text =
        deliveryOrdersModel?.data?[index].phone ?? "رقم الهاتف";
    descriptionController.text =
        deliveryOrdersModel?.data?[index].description ?? "الوصف";
    emit(InitControllerState());
  }

  //DONE
  deliveryGetAllOrders() async {
    emit(DeliveryGetAllOrdersLoadingState());
    DioHelper.get(
      endPoint: EndPoints.deliveryGetAllOrders,
      token: await SecureStorage.getData(SecureKeys.token),
    ).then(
      (value) {
        debugPrint("Success On .Then In Delivery Get All Orders");
        deliveryOrdersModel = DeliveryOrdersModel.fromJson(value.data);
        showToast(
          msg: value.data['message'],
          isError: false,
        );
        emit(DeliveryGetAllOrdersSuccessState());
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Get All Orders");
      print(error.toString());
      emit(DeliveryGetAllOrdersErrorState());
    });
  }

  //DONE
  deliveryAddOfferPrice({
    required int orderId,
  }) async {
    emit(DeliveryAddOfferPriceLoadingState());
    print(orderId);
    DioHelper.post(
      endPoint: EndPoints.deliveryAddOfferPrice,
      token: await SecureStorage.getData(SecureKeys.token),
      data: {'price': int.parse(priceController.text), 'order_id': orderId},
    ).then(
      (value) {
        debugPrint("Success On .Then In Delivery Add Offer Price");
        showToast(
          msg: value.data['message'],
          isError: false,
        );
        emit(DeliveryAddOfferPriceSuccessState());
      },
    ).catchError((error) {
      debugPrint("Error On .CatchError In Delivery Add Offer Price");
      print(error.toString());
      emit(DeliveryAddOfferPriceErrorState());
    });
  }
}
