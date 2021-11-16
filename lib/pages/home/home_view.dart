import 'package:achievetest/components/components.dart';
import 'package:achievetest/components/custom_app_bar.dart';
import 'package:achievetest/components/widget_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:achievetest/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appBar: CustomAppBar(
        title: Text(
          'Achieve',
          style: Theme.of(context).textTheme.headline6,
        ),
        context: context,
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            },
          ),
        ],
      ),
      child: const SizedBox(
        child: Text('Testing'),
      ),
    );
  }
}
