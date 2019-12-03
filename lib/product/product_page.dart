import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/product/product_bloc.dart';
import 'package:flutter_ecommerce/shared/model/cartegory_model.dart';
import 'package:flutter_ecommerce/shared/model/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductPage extends StatefulWidget {
  final CategoryModel category;
  ProductPage({this.category}) : super();

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.getBloc<ProductBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.category.description),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: productBloc.getProducts(widget.category.id),
        builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInImage.memoryNetwork(
                      image: snapshot.data[index].image.imageUrl,
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover,
                    );
                  },
                  staggeredTileBuilder: (int index) {
                    return StaggeredTile.count(
                        snapshot.data[index].image.imageTotalX, snapshot.data[index].image.imageTotalY);
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
              ),
            );
          }
        },
      ),
    );
  }
}
