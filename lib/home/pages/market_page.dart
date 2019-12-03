import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/widget/custom_drawer.dart';

class MarketPage extends StatefulWidget {
  MarketPage({Key key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Lojas'),
        centerTitle: true,
      ),
      body: Container(child: Center(child: Text('Markert'))),
    );
  }
}
