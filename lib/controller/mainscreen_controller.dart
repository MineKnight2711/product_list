import 'dart:developer';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list/api/product_api.dart';

import '../model/product/product.dart';

class HomeScreenController extends GetxController {
  late ProductApi _productApi;
  RxList<Product> listProduct = <Product>[].obs;
  RxList<Product> listSearchProDuct = <Product>[].obs;
  RxInt totalProduct = 1000.obs;
  RxBool isLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    _productApi = ProductApi();
    getProducts();
    scrollController.addListener(loadMoreData);
    searchQuerySubject.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen((query) async {
      await searchProduct(query);
    });
  }

  final searchQuerySubject = BehaviorSubject<String>();

  void onSearchQueryChanged(String query) {
    searchQuerySubject.add(query);
  }

  void loadMoreData() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        listProduct.length < totalProduct.value) {
      getProducts();
    }
  }

  Future<void> getProducts() async {
    isLoading.value = true;
    final response = await _productApi.getProducts(listProduct.length);
    if (response.message == 'Success') {
      final listProductResponse = response.data["products"] as List;
      totalProduct.value = response.data["total"];
      listProduct.value = listProductResponse
          .map((product) => Product.fromJson(product))
          .toList();
      isLoading.value = false;
      log('List product length: ${listProduct.length}', time: DateTime.now());
    }
  }

  Future<void> searchProduct(String query) async {
    isLoading.value = true;
    final response = await _productApi.searchProduct(query);
    if (response.message == 'Success') {
      final listProductResponse = response.data["products"] as List;
      totalProduct.value = response.data["total"];
      listSearchProDuct.value = listProductResponse
          .map((product) => Product.fromJson(product))
          .toList();
      log('List product search: ${listSearchProDuct.length}',
          time: DateTime.now());
      isLoading.value = false;
    }
  }
}
