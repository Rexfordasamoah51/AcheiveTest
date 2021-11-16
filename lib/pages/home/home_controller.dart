import 'package:achievetest/pages/home/home_model.dart';
import 'package:achievetest/services/assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Asset model
  AssetsResponseModel assetsModel = AssetsResponseModel(data: []);
  bool isLoading = false;
  int _limit = 20;

  int get limit => _limit;

  set limit(value) => _limit = (limit + value).toInt();

  @override
  void onInit() {
    fetchAssets(limit);
    super.onInit();
  }

  // Fetch assets from the server
  Future fetchAssets(int limit) async {
    isLoading = true;
    update();
    assetsModel = await AssetsAPI.getAssets(limit: limit);
    isLoading = false;
    update();
  }
}
