import 'package:flutter/material.dart';
import 'package:fluttersample/components/button.dart';
import 'package:fluttersample/helper/helper.dart';

class BotoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Botões Sample"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return ListView(
      children: <Widget>[
        ButtonPrimary("Primary", () => DialogsHelper.messageDialog("Botão Primary", context)),
        ButtonDanger("Danger", () => DialogsHelper.messageDialog("Botão Danger", context)),
        ButtonDefault("Default", () => DialogsHelper.messageDialog("Botão Default", context)),
      ],
    );
  }
}
