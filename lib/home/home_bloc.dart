import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_ecommerce/shared/model/cartegory_model.dart';

class HomeBloc extends BlocBase {
  Firestore _firestore;

  StreamController<int> _controller = StreamController<int>();
  Stream<int> get streamIndexPage => _controller.stream;
  get setPage => _controller.sink.add;

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  HomeBloc() {
    _firestore = Firestore.instance;
  }

  Future<List<CategoryModel>> categories() async {
    var docs = await _firestore.collection('categories').orderBy('order').getDocuments();
    return docs.documents.map((snap) => CategoryModel.fromFirebase(snap)).toList();
  }
}
