import 'package:achievetest/common/values/values.dart';
import 'package:achievetest/pages/home/home.dart';
import 'package:achievetest/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

//Managing our api request
class AssetsAPI {
  static Future<dynamic> getAssets({int? limit}) async {
    try {
      response = await Request().get(
        '/assets?limit=$limit',
      );
    } catch (e) {
      EasyLoading.showToast(retry);
      Future.delayed(const Duration(seconds: 6), () => getAssets(limit: limit));
    }
    return AssetsResponseModel.fromJson(response);
  }
}
