import 'dart:io';

import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.termsAccepted = false,
    this.gender,
    this.vehicleId,
    this.idImage,
    this.licenceImage,
    this.profileImage,
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;
  final bool termsAccepted;
  final String? gender;
  final int? vehicleId;
  final File? idImage, licenceImage, profileImage;

  bool get hasAllImages =>
      idImage != null && licenceImage != null && profileImage != null;

  RegisterState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    bool? termsAccepted,
    String? gender,
    int? vehicleId,
    File? idImage,
    File? licenceImage,
    File? profileImage,
  }) => RegisterState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    termsAccepted: termsAccepted ?? this.termsAccepted,
    gender: gender ?? this.gender,
    vehicleId: vehicleId ?? this.vehicleId,
    idImage: idImage ?? this.idImage,
    licenceImage: licenceImage ?? this.licenceImage,
    profileImage: profileImage ?? this.profileImage,
  );

  @override
  List<Object?> get props => [
    status,
    msg,
    errorType,
    termsAccepted,
    gender,
    vehicleId,
    idImage?.path,
    licenceImage?.path,
    profileImage?.path,
  ];
}
