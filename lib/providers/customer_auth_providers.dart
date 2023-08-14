

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticash/services/auth_services.dart';
import 'package:opticash/viewModels/customer_auth_vm.dart';

final customerAuthViewModelProvider = ChangeNotifierProvider<CustomerAuthViewModel>(
    (ref) => CustomerAuthViewModel(ref));



final customerAuthServiceProvider =
    Provider.autoDispose<UserAuthService>((ref) => UserAuthService(ref));