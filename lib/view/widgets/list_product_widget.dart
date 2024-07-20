import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_list/controller/mainscreen_controller.dart';

import '../../model/product/product.dart';

class ListProductWidget extends StatelessWidget {
  final List<Product> products;
  final ScrollController scrollController;
  final bool isLoading, isOutOfStock;
  const ListProductWidget({
    super.key,
    required this.products,
    required this.scrollController,
    required this.isLoading,
    required this.isOutOfStock,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: products.length,
      shrinkWrap: false,
      itemBuilder: (context, index) {
        final product = products[index];
        return Column(
          children: [
            ProductItemWidget(product: product),
            if (index == products.length - 1 && isLoading)
              const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}

class ProductItemWidget extends GetView<HomeScreenController> {
  final Product product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Text(product.id.toString()),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                product.title.toString(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 50.w,
              child: Image.network(
                product.thumbnail.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        trailing: StreamBuilder(
          stream: controller.isFavorite(product.id ?? 0),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return IconButton(
                icon: Icon(
                  snapshot.data == false
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: snapshot.data == false ? Colors.black : Colors.red,
                ),
                onPressed: () => controller.addToFavorite(product),
              );
            }
            return IconButton(
              icon: Icon(
                snapshot.data == false ? Icons.favorite_border : Icons.favorite,
                color: snapshot.data == false ? Colors.black : Colors.red,
              ),
              onPressed: () => controller.addToFavorite(product),
            );
          },
        ));
  }
}
