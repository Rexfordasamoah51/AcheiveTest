import 'package:achievetest/pages/home/home.dart';
import 'package:achievetest/utils/utils.dart';

class AssetsAPI {
  static Future<dynamic> getAssets() async {
    var response = await Request().get(
      '/assets',
    );
    return AssetsResponseModel.fromJson(response);
  }
}
