

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticash/services/auth_services.dart';
import 'package:opticash/viewModels/user_auth_vm.dart';

final customerAuthViewModelProvider = ChangeNotifierProvider<USerAuthViewModel>(
    (ref) => USerAuthViewModel(ref));



final customerAuthServiceProvider =
    Provider.autoDispose<UserAuthService>((ref) => UserAuthService(ref));