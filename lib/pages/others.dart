import 'package:flutter/material.dart';
import 'package:fluttersample/components/button.dart';
import 'package:fluttersample/helper/helper.dart';

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
    
    return ListView(children: <Widget>[
      ButtonDefault("Diálogo", () => DialogsHelper.messageDialog("Exemplo de ShowDialog", context)),
      ButtonDefault("Toast", () => DialogsHelper.toast("Exemplo de Toast (plugin flutter_styled_toast)", context)),
      ButtonDefault("Popup", () => _popup(context)),
          ],);
                
  }

  _popup(context){
    showDialog(
      context: context,
        builder: (BuildContext context) => new Container(),
    );
  }
}
