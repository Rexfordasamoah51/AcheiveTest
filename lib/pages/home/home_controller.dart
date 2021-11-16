import 'package:achievetest/pages/home/home_model.dart';
import 'package:achievetest/services/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var assetsModel;

  @override
  void onInit() {
    fetchAssets();
    super.onInit();
  }

  Future fetchAssets() async {
    assetsModel = await AssetsAPI.getAssets();
    update();
  }
}
