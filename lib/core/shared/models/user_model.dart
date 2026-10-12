import 'dart:convert';

import '../../services/shared_preference.dart';
import '../enums/user_type.dart';
import 'base.dart';

/// The signed-in user, kept in memory as `UserModel.i` and persisted with
/// [CacheHelper] (`AppCached.user`).
class UserModel extends Model {
  UserModel._();

  static UserModel i = UserModel._();

  late String name, phone, email, token, status;
  late UserType type;

  bool get isAuth => token.isNotEmpty;

  void fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
    phone = stringFromJson(json, 'phone');
    email = stringFromJson(json, 'email');
    token = stringFromJson(json, 'token');
    status = stringFromJson(json, 'status');
    type = UserType.fromName(stringFromJson(json, 'type'));
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'token': token,
    'status': status,
    'type': type.name,
  };

  Future<void> save() async {
    await CacheHelper.setValue(AppCached.user, jsonEncode(toJson()));
  }

  Future<void> clear() async {
    await CacheHelper.clear();
    fromJson();
  }

  void get() {
    final String user = CacheHelper.getValue(AppCached.user) ?? '{}';
    fromJson(jsonDecode(user));
  }

  @override
  String toString() => 'UserModel{id: $id, name: $name, type: ${type.name}}';
}
