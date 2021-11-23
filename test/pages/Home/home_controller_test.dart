import 'package:achievetest/pages/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

class HoneControllerMock extends GetxController
    with Mock
    implements HomeController {}

void main() {
  final homeController = HomeController();
  setUp(() async {
    await homeController.fetchAssets(10);
  });

  group(
    'Test fetching Assets',
    () {
      test('Should return length of 10 when the call returns no error', () {
        final assets = homeController.assetsModel.data;
        expect(assets.length, 10);
      });
    },
  );
}
