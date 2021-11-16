import 'dart:io';

import 'package:flutter/material.dart';
import 'package:achievetest/utils/utils.dart';
import 'package:flutter/services.dart';

/// Global configuration
class Global {
  /// User configuration
  // static UserLoginResponseModel? profile = UserLoginResponseModel(token: null);

  /// Whether to release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // run initial
    WidgetsFlutterBinding.ensureInitialized();

    // Request module initialization
    Request();

    // Local storage initialization

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
