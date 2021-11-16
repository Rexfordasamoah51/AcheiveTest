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
        actions: const [
          _SearchBar(),
        ],
      ),
      child: const _AssetsDisplay(),
    );
  }
}

class _AssetsDisplay extends GetView<HomeController> {
  const _AssetsDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder(
        init: HomeController(),
        builder: (_) {
          return ListView.builder(
            itemCount: controller.assetsModel.data.length,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.assetsModel.data.isEmpty
                  ? const _Loader()
                  : Text(
                      ' ${controller.assetsModel.data[index]['name']}',
                    ),
            ),
          );
        },
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2,
      child: const CircularProgressIndicator(),
    );
  }
}

class _SearchBar extends GetView<HomeController> {
  const _SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.black,
      icon: const Icon(Icons.search),
      onPressed: () {
        showSearch(
            context: context,
            delegate: SearchData(
              data: controller.assetsModel.data,
            ));
      },
    );
  }
}
