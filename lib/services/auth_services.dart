import 'package:opticash/http/api_manager.dart';
import 'package:opticash/model/customer_notification_model.dart';
import 'package:opticash/model/customer_response_model.dart';
import 'package:opticash/model/file_upload_response_model.dart';
import 'package:opticash/utils/logger.dart';
import 'package:opticash/utils/strings.dart';
import 'package:opticash/utils/temporary_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAuthService extends ApiManager {
  final Ref reader;

  final loginRoute = '/customer/login';

  final intiateResetPasswordRoute = '/customer/initiate-password-reset';
  final verifyResetOTPRoute = '/customer/verify-reset-otp';
  final resetPasswordRoute = '/customer/reset-password';
  final changePasswordRoute = '/customer/change-password/';
  final customerDashboardRoute = '/customer/dashboard/';
  final customerNotificationRoute = '/notification/customer/';
  final getOneSiteRoute = '/siting/get-siting/';
  final updateProfileImageRoute = '/customer/update/';
  final uploadFileRoute = '/upload';

  UserAuthService(this.reader) : super(reader);

  //Login with email and password
  Future<CustomerLoginResponseModel> loginCustomer(
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
      return CustomerLoginResponseModel.fromJson(response.data);
    } else {
      return CustomerLoginResponseModel(message: data['message'].toString());
    }
  }

}
