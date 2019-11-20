import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/widget/custom_drawer.dart';
import 'package:flutter_ecommerce/shared/model/cartegory_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

import '../home_bloc.dart';

class HomeCategoriesPage extends StatefulWidget {
  @override
  _HomeCategoriesPageState createState() => _HomeCategoriesPageState();
}

class _HomeCategoriesPageState extends State<HomeCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.pink, Colors.pink[500]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.9],
            )),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                expandedHeight: 50,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Loja de Rosa'),
                  centerTitle: true,
                ),
                floating: true,
              ),
              FutureBuilder(
                future: BlocProvider.getBloc<HomeBloc>().categories(),
                builder: (BuildContext _, AsyncSnapshot<List<CategoryModel>> snapshot) {
                  if (snapshot.hasData) {
                    var categories = snapshot.data;
                    return SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 2,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeInImage.memoryNetwork(
                          image: categories[index].image.imageUrl,
                          placeholder: kTransparentImage,
                          fit: BoxFit.cover,
                        );
                      },
                      staggeredTileBuilder: (int index) {
                        return StaggeredTile.count(
                          categories[index].image.imageTotalX,
                          categories[index].image.imageTotalY,
                        );
                      },
                    );
                  } else
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
