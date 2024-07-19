import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_list/model/response_model.dart';

class ProductApi {
  final String productBaseUrl = 'https://dummyjson.com/products';

  Future<ResponseModel> getProducts(int productLenght) async {
    try {
      final url = Uri.parse(
          '$productBaseUrl?limit=${productLenght + 20}&skip=$productLenght&select=title,price,thumbnail');
      final response = await http.get(url);
      ResponseModel responseModel = ResponseModel();
      if (response.statusCode == 200) {
        responseModel.message = 'Success';
        responseModel.data = jsonDecode(utf8.decode(response.bodyBytes));
        print(responseModel.data);
        return responseModel;
      }
      responseModel.message = 'Failed';
      return responseModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseModel> searchProduct(String query) async {
    try {
      final url = Uri.parse('$productBaseUrl/search?q=$query');
      final response = await http.get(url);
      ResponseModel responseModel = ResponseModel();
      if (response.statusCode == 200) {
        responseModel.message = 'Success';
        responseModel.data = jsonDecode(utf8.decode(response.bodyBytes));
        print(responseModel.data);
        return responseModel;
      }
      responseModel.message = 'Failed';
      return responseModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
