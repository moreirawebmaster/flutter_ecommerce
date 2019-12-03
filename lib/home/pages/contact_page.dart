import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/widget/custom_drawer.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contato'),
      ),
      body: Container(
        child: Center(
          child: Text('Contato'),
        ),
      ),
    );
  }
}
