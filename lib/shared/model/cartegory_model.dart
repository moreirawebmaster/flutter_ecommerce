import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/shared/model/image.dart';

class CategoryModel {
  String id;
  String description;
  Image image;

  CategoryModel({this.id, this.description, this.image});

  factory CategoryModel.fromFirebase(DocumentSnapshot snapshot) {
    return CategoryModel(
        id: snapshot.documentID,
        description: snapshot.data['description'],
        image: Image(
          imageUrl: snapshot.data['image']['imageUrl'],
          imageTotalX: snapshot.data['image']['imageTotalX'],
          imageTotalY: snapshot.data['image']['imageTotalY'],
        ));
  }

  Map<dynamic, dynamic> toFirebase() {
    return {
      'description': this.description,
      'image': {
        'imageUrl': this.image.imageUrl,
        'imageTotalX': this.image.imageTotalX,
        'imageTotalY': this.image.imageTotalY
      }
    };
  }
}
