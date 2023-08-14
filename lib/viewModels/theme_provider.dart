
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticash/style/theme.dart';

final themeDataProvider = ChangeNotifierProvider<ThemeProvider>(
    (ref) => ThemeProvider());
