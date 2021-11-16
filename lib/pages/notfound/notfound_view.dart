import 'package:achievetest/components/widget_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:achievetest/router/app_pages.dart';
import 'package:get/get.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: ListTile(
        title: const Text('It seems you are lost'),
        subtitle: const Text('Click to fuse the page'),
        onTap: () => Get.offAllNamed(AppRoutes.Home),
      ),
    );
  }
}
