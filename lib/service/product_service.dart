import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product/product.dart';

class ProductService {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('favorite');

  Future<void> addToFavorite(Product product) async {
    final bool isFavorite =
        await productsCollection.where("id", isEqualTo: product.id).get().then(
              (value) => value.docs.isNotEmpty,
            );
    if (!isFavorite) {
      await productsCollection.add(product.toJson());
    } else {
      await productsCollection.where("id", isEqualTo: product.id).get().then(
        (value) {
          if (value.docs.isNotEmpty) {
            productsCollection.doc(value.docs.first.id).delete();
          }
        },
      );
    }
  }

  Stream<bool> checkFavoriteStream(int productId) {
    final productDocStream =
        productsCollection.where("id", isEqualTo: productId).snapshots();

    return productDocStream.map((snapshot) {
      return snapshot.docs.isNotEmpty;
    });
  }
}
