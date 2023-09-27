import 'package:alo_delivery/view_model/bloc/delivery_cubit/delivery_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(DeliveryInitial());

  static DeliveryCubit get(context) => BlocProvider.of<DeliveryCubit>(context);

  var priceFormKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();





}
