import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttersample/components/button.dart';
import 'package:fluttersample/helper/helper.dart';
import 'package:fluttersample/helper/navigation.dart';
import 'package:fluttersample/pages/badge.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_awesome.dart';


class OtherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
        title: Text("Mensagens, popus etc"),
      ),
      body: _body(context)
    );
  }

  _body(context){
    
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ButtonDefault("Diálogo", () => DialogsHelper.messageDialog("Exemplo de ShowDialog", context)),
        ButtonDefault("Toast", () => DialogsHelper.toast("Exemplo de Toast (plugin flutter_styled_toast)", context)),
        ButtonDefault("Popup", () => _popup(context)),
        Badge(position: BadgePosition.topRight(), badgeContent: Text('10'), child: ButtonDefault("Badge", () => openPage(context, OthersBadge(), replace: false)),),
        ButtonDefault("Font Awesome", () => openPage(context, FontAwesomeGalleryApp(), replace: false)),
         Center(child: Text('Google Fonts - plugin', style: GoogleFonts.lato(fontStyle: FontStyle.italic, fontSize: 30),))
      ]);
  }

  _popup(context){
    showDialog(
      context: context,
        builder: (BuildContext context) => new Container(),
    );
  }
}
