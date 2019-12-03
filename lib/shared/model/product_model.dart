import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/shared/model/image.dart';

class ProductModel {
  String id;
  String categoryId;
  String description;
  Image image;
  double price;
  int quantity;
  bool isAcceptTicket;
  int maxQuantityPerAccount;

  ProductModel({
    this.id,
    this.categoryId,
    this.description,
    this.image,
    this.price,
    this.quantity,
    this.isAcceptTicket,
    this.maxQuantityPerAccount,
  });

  factory ProductModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data;
    var prod = ProductModel(
      id: snapshot.documentID,
      categoryId: data['categoryId'],
      description: data['description'],
      image: Image(
        imageUrl: snapshot.data['image']['imageUrl'],
        imageTotalX: snapshot.data['image']['imageTotalX'],
        imageTotalY: snapshot.data['image']['imageTotalY'],
      ),
      price: double.parse(data['price'].toString()),
      quantity: data['quantity'],
      isAcceptTicket: data['isAcceptTicket'],
      maxQuantityPerAccount: data['maxQuantityPerAccount'],
    );

    return prod;
  }
}
