import 'package:opticash/http/api_manager.dart';
import 'package:opticash/model/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAuthService extends ApiManager {
  final Ref reader;

  final loginRoute = '/user/test/login';

  final registerRoute = '/user/test/register';

  UserAuthService(this.reader) : super(reader);

  //Login with email and password
  Future<UserResponse> loginUser(
    String email,
    String password,
  ) async {
    final signInBody = {
      "email": email,
      "password": password,
    };

    final response = await postHttp(loginRoute, signInBody);

    var data = response.data;

    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.data);
    } else {
      return UserResponse(status: data['status'].toString());
    }
  }

  //Login with email and password
  Future registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final signInBody = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password
    };

    final response = await postHttp(registerRoute, signInBody);

    var data = response.data;

    return data;
  }
}
