import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/widget/custom_drawer.dart';

import 'home_bloc.dart';
import 'pages/home_categories_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  HomeBloc bloc = BlocProvider.getBloc<HomeBloc>();
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    bloc.streamIndexPage.listen((index) => pageController.jumpToPage(index));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        HomeCategoriesPage(),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(),
          body: Container(
            child: Text('Categoria'),
          ),
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(),
          body: Container(
            child: Text('Lojas'),
          ),
        ),
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(),
          body: Container(
            child: Text('Contato'),
          ),
        ),
      ],
    );
  }
}
