import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_list/view/widgets/list_product_widget.dart';
import '../../controller/mainscreen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burning Bros Shop"),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 60.h),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                controller.onSearchQueryChanged(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search Product",
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.listSearchProDuct.clear();
                  },
                  icon: const Icon(CupertinoIcons.xmark),
                ),
              ),
            ),
          ),
        ),
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
