import 'package:flutter/material.dart';

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
            ListTile(
              leading: Text(product.id.toString()),
              title: Text(product.title.toString()),
              trailing: Image.network(
                product.thumbnail.toString(),
                fit: BoxFit.cover,
              ),
            ),
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
