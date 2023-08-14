import 'dart:convert';

import 'package:opticash/model/customer_response_model.dart';
import 'package:opticash/utils/temporary_storage.dart';

class UserDB {
  static const _profile = "profile";

  static UserData? getUser() {
    final data = LocalStorageManager.getString(key: _profile);
    if (data.isNotEmpty) {
      return UserData.fromJson(jsonDecode(data));
    }

    return null;
  }

  static Future addProfile(UserData model) async {
    await LocalStorageManager.setString(
        key: _profile, value: jsonEncode(model.toJson()));
  }

  static Future deleteUser() async {
    await LocalStorageManager.eraseData(key: _profile);
  }
}
