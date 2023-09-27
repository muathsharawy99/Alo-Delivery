import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage storage;

  static initSecureStorage() async {
    storage = const FlutterSecureStorage();
  }

  static void setData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String> getData(String key) async {
    return await storage.read(key: key) ?? 'No data found!';
  }

  static void deleteData(String key) async {
    await storage.delete(key: key);
  }

  static void deleteAllData() async {
    await storage.deleteAll();
  }
}
