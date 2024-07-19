import 'package:json_annotation/json_annotation.dart';
part "product.g.dart";

@JsonSerializable(explicitToJson: true)
class Product {
  int? id;
  String? title;
  int? price;
  String? thumbnail;
  Product({this.id, this.title, this.price, this.thumbnail});
}
