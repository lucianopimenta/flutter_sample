import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersample/helper/navigation.dart';
import 'package:fluttersample/model/item.dart';
import 'package:fluttersample/pages/actionButton.dart';
import 'package:fluttersample/pages/botoes.dart';
import 'package:fluttersample/pages/card.dart';
import 'package:fluttersample/pages/home_drawer.dart';
import 'package:fluttersample/pages/listView.dart';
import 'package:fluttersample/pages/login.dart';
import 'package:fluttersample/pages/tab.dart';

class HomePageMD extends StatefulWidget {
  HomePageMD({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageMDState createState() => _HomePageMDState();
}

class _HomePageMDState extends State<HomePageMD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body()
    );
  }

  _body() {

    List<Item> itens = [
      Item(1,
          "https://cdn0.iconfinder.com/data/icons/social-messaging-productivity-4/128/menu-2-512.png",
          "Dranwer",
          "Exemplo de menu lateral"),
      Item(2,
          "https://pngimage.net/wp-content/uploads/2018/06/list-view-icon-png-8.png",
          "ListView",
          "Listas com Flutter"),
      Item(3,
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTu12ZPW1i2S8Fmb49ODSkfmMJo2k5L3EuOp1Fu5l4QCgJVMKVT&usqp=CAU",
          "Botão",
          "Botão estilo BootStrap"),
      Item(4,
          "https://www.clipartmax.com/png/middle/290-2908659_login-icon-png-free-user-access-icon.png",
          "Login",
          "Login com CircularProgressIndicator"),
      Item(5,
          "https://cdn1.iconfinder.com/data/icons/windows-2/24/New-Tab-512.png",
          "TabPage",
          "Abas"),
      Item(6,
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRrjerMkR9-JKHLFvBbmVeMZFDhb6hoGBFTelCALYvf-zH7WueH&usqp=CAU",
          "Actions",
          "Botões na barra"),
      Item(7,
          "https://cdn1.iconfinder.com/data/icons/layout-1/512/layout-columns-card-alternating-512.png",
          "Card",
          "Card para exibir em listas"),
      Item(8,
          "https://img1.gratispng.com/20180204/jee/kisspng-database-ico-icon-database-icons-5a76f029e9ccd1.1519345115177441699577.jpg",
          "Banco de dados",
          "SQLite"),
      Item(9,
          "https://winaero.com/blog/wp-content/uploads/2019/11/Photos-new-icon.png",
          "Fotos",
          "Tirar e armazenar fotos"),
      Item(10,
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Google_Maps_icon.svg/1200px-Google_Maps_icon.svg.png",
          "Mapas",
          "Google Maps"),
      Item(11,
          "https://www.pinclipart.com/picdir/middle/210-2108807_tete-mobile-svg-png-icon-free-download-phone.png",
          "Splash Screen",
          "Tela inicial do app"),
      Item(12,
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDAq3-9ItD5r_znnNMR1yPDFDf6oWxksDmfEBb1w7J_PVo1itV&usqp=CAU",
          "Outros",
          "Mensagens, Popup etc"),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: Center( child: Text("Listagem de controles", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),))
        ),
        Expanded(
          child: ListView.builder(
            itemCount: itens.length,
            itemBuilder: (BuildContext context, int index) {
              Item item = itens[index];

              return Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.network(item.urlImage, alignment: Alignment.center, height: 36, width: 36,),
                      title: Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text(item.subTitle),
                      onTap: () => onPushItem(context, item),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  onPushItem(context, Item item) {
    switch(item.index) {
      case 1: { openPage(context, HomePageDrawer(title: "Dranwer",), replace: false); }
      break;
      case 2: { openPage(context, ListViewPage(), replace: false); }
      break;
      case 3: { openPage(context, BotoesPage(), replace: false); }
      break;
      case 4: { openPage(context, LoginPage(), replace: false); }
      break;
      case 5: { openPage(context, TabPage(), replace: false); }
      break;
      case 6: { openPage(context, ActionButtonPage(), replace: false); }
      break;
      case 7: { openPage(context, CardPage(), replace: false); }
      break;
    }
  }
}