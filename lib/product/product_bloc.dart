import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/shared/model/product_model.dart';

class ProductBloc extends BlocBase {
  Firestore _firestore;

  ProductBloc() {
    _firestore = Firestore.instance;
  }

  Future<List<ProductModel>> getProducts(String categoryId) async {
    var products = await _firestore.collection('products').getDocuments();
    print(products);
    return products.documents.map((item) {
      return ProductModel.fromFirebase(item);
    }).toList();
  }
}
