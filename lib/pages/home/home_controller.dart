import 'package:achievetest/pages/home/home_model.dart';
import 'package:achievetest/services/assets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  // Asset model
  AssetsResponseModel assetsModel = AssetsResponseModel(data: []);

  final convert = NumberFormat("#,##0.00", "en_US");
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
