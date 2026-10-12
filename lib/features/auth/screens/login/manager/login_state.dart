import 'package:alo_delivery/core/extensions/cubit_enums.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = RequestState.initial,
    this.msg = '',
    this.errorType = ErrorType.none,
    this.isPending = false,
  });

  final RequestState status;
  final String msg;
  final ErrorType errorType;

  /// `done` + pending → the account exists but isn't activated yet.
  final bool isPending;

  LoginState copyWith({
    RequestState? status,
    String? msg,
    ErrorType? errorType,
    bool? isPending,
  }) => LoginState(
    status: status ?? this.status,
    msg: msg ?? this.msg,
    errorType: errorType ?? this.errorType,
    isPending: isPending ?? this.isPending,
  );

  @override
  List<Object?> get props => [status, msg, errorType, isPending];
}
