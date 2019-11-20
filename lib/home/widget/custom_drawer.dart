import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/home/home_bloc.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.getBloc<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pink, Colors.pink[500]],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0, 0.9])),
            accountEmail: Text('moreirawebmaster@gmail.com'),
            accountName: Text('Thiago Moreira'),
            currentAccountPicture: CircleAvatar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              child: Text(
                'T',
                style: TextStyle(fontSize: 22),
              ),
            ),
            arrowColor: Colors.white,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => setPage(0, context),
                ),
                ListTile(
                  leading: Icon(Icons.landscape),
                  title: Text('Categorias'),
                  onTap: () => setPage(1, context),
                ),
                ListTile(
                  leading: Icon(Icons.store),
                  title: Text('Lojas'),
                  onTap: () => setPage(2, context),
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Contato'),
                  onTap: () => setPage(3, context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void setPage(int index, BuildContext context) {
    bloc.setPage(index);
    Navigator.of(context).pop();
  }
}
