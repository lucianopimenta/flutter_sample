import 'package:flutter/material.dart';
import 'package:fluttersample/helper/helper.dart';

class ActionButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botões"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              DialogsHelper.messageDialog("Botão Delete", context);
            },
          ),
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
             DialogsHelper.messageDialog("Botão Novo", context);
            },
          )
        ],
      ),
      body: Container(child: Center(child: Text("Botões na barra de navegação"))),
    );
  }
}
