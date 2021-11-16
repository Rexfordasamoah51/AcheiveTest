import 'package:achievetest/pages/home/home.binding.dart';
import 'package:achievetest/pages/home/home_view.dart';
import 'package:achievetest/pages/notfound/notfound_view.dart';

import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => const NotfoundPage(),
  );
}
