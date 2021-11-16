import 'package:achievetest/common/colors/colors.dart';
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
          return const _AssetsList();
        },
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
    return ListView.builder(
      itemCount: controller.assetsModel.data.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) {
        var name = '${controller.assetsModel.data[index]['name']}';
        var price = truncate(
          MoneyFormat.moneyFormat(
              '${controller.assetsModel.data[index]['priceUsd']}'),
          9,
        );
        var market = truncate(
          MoneyFormat.moneyFormat(
              '${controller.assetsModel.data[index]['marketCapUsd']}'),
          9,
        );
        return controller.assetsModel.data.isEmpty
            ? const _Loader()
            : ListTile(
                title: Text(
                  name,
                ),
                subtitle: Text(
                  'Prices: $price',
                ),
                trailing: Text(
                  'Market Cap $market',
                ),
              );
      },
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
