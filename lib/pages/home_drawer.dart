import 'package:flutter/material.dart';
import 'package:fluttersample/components/button.dart';

class HomePageDrawer extends StatefulWidget {
  HomePageDrawer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: _drawer(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ButtonDefault("Voltar", () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }

  _drawer(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Luciano Pimenta"),
            accountEmail: Text("lucianoalmeidapimenta@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqP85ZnOcRSCX3nlYdkCvSxhSuZs0bLt1He8EvGr5ne8c7mTqW"),
            ),
          ),
          ListTile(
            title: Text("Favoritos"),
            subtitle: Text("mais informações..."),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Ajuda"),
            subtitle: Text("mais informações..."),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}