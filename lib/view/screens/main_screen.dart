import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list/view/widgets/list_product_widget.dart';
import '../../controller/mainscreen_controller.dart';
import '../widgets/main_screen_appbar_widget.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppbar(
        searchController: controller.searchController,
        onClearPressed: () {
          controller.listSearchProDuct.clear();

          controller.searchController.clear();
        },
        onSearchChanged: controller.onSearchQueryChanged,
      ),
      body: Obx(
        () {
          if (controller.listProduct.isEmpty) {
            return const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading..."),
                ],
              ),
            );
          } else if (controller.listSearchProDuct.isNotEmpty &&
              controller.listProduct.isNotEmpty) {
            return ListProductWidget(
              products: controller.listSearchProDuct,
              scrollController: ScrollController(),
              isLoading: controller.isLoading.value,
              isOutOfStock: false,
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListProductWidget(
                  products: controller.listProduct,
                  scrollController: controller.scrollController,
                  isLoading: controller.isLoading.value,
                  isOutOfStock: controller.isOutOfStock.value,
                ),
              ),
              if (controller.isOutOfStock.value)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Đã hết sản phẩm"),
                ),
            ],
          );
        },
      ),
    );
  }
}
