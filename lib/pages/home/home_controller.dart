import 'package:achievetest/pages/home/home_model.dart';
import 'package:achievetest/services/assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Asset model
  AssetsResponseModel assetsModel = AssetsResponseModel(data: []);

  @override
  void onInit() {
    fetchAssets();
    super.onInit();
  }

  // Fetch assets from the server
  Future fetchAssets() async {
    assetsModel = await AssetsAPI.getAssets();
    update();
  }
}
