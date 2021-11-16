import 'package:achievetest/components/components.dart';
import 'package:achievetest/components/custom_app_bar.dart';
import 'package:achievetest/components/widget_wrapper.dart';
import 'package:achievetest/services/services.dart';
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
        title: const _AppBarTitle(),
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
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(child: _AssetsList()),
              // when the _loadMore function is running

              _Loader(controller: controller),
            ],
          );
        },
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.isLoading ? 50.0 : 0,
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _AssetsList extends GetView<HomeController> {
  const _AssetsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            _loadMore();
          }
        }
        return true;
      },
      child: const _AssetsBuilder(),
    );
  }

  /// load more data
  void _loadMore() {
    if (controller.assetsModel.data.isNotEmpty &&
        controller.isLoading == false) {
      controller.fetchAssets(
        controller.assetsModel.data.length + controller.limit,
      );
      controller.update();
    }
  }
}

class _AssetsBuilder extends GetView<HomeController> {
  const _AssetsBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) {
        return ListView.builder(
          itemCount: controller.assetsModel.data.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            var name = '${controller.assetsModel.data[index]['name']}';
            var price = truncate(
              MoneyFormat.moneyFormat(
                '${controller.assetsModel.data[index]['priceUsd']}',
              ),
              9,
            );
            var market = truncate(
              MoneyFormat.moneyFormat(
                '${controller.assetsModel.data[index]['marketCapUsd']}',
              ),
              9,
            );
            return ListTile(
              title: Text(name),
              subtitle: Text('Prices: $price'),
              trailing: Text('Market Cap $market'),
            );
          },
        );
      },
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
          ),
        );
      },
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Achieve',
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
