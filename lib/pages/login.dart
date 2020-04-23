import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttersample/components/button.dart';
import 'package:fluttersample/helper/HttpRest.dart';
import 'package:fluttersample/helper/helper.dart';
import 'package:fluttersample/helper/navigation.dart';
import 'package:fluttersample/helper/prefs.dart';
import 'package:fluttersample/model/responseResult.dart';
import 'package:fluttersample/pages/home_master_detail.dart';
import 'package:http/http.dart' as http;

import 'home_drawer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  var password = TextEditingController();
  var login = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool showProgress = false;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body(context));
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network("http://13.59.75.47/WaiterPlease/bg.jpg"),
          Container(
              padding: EdgeInsets.all(24),
              child: Text(
                "Teste Flutter",
                style: TextStyle(color: Colors.black, fontSize: 35),
              )),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _login(),
                _password(),
              ],
            ),
          ),
          showProgress ? Center(child: CircularProgressIndicator()) : ButtonPrimary("Login", () => onLogin(context)),
        ],
      ),
    );
  }

  _login() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
      child: TextFormField(
        validator: (String text) {
          if (text.isEmpty)
            return "Campo obrigatório";
          else
            return null;
        },
        controller: login,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Login",
          hintText: 'Digite o login',
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  _password() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 8),
      child: TextFormField(
        validator: (String text) {
          if (text.isEmpty)
            return "Campo obrigatório";
          else
            return null;
        },
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Senha",
          hintText: 'Digite a senha',
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  onLogin(BuildContext context) async {
    if (!_formKey.currentState.validate()) return;

    setState(() {
      showProgress = true;
    });

    Map params = {
      'usuario': login.text.trimRight(),
      'senha': password.text.trimRight()
    };

    var url = 'http://13.59.75.47:8083/api/';
    Map<String, String> headers = {"Content-Type": "application/json"};
    String s = json.encode(params);

    var response = await http.post(url + "auth", body: s, headers: headers);

    Map mapResponse = json.decode(response.body);
    var result = ResponseResult.fromJson(mapResponse);

    if (result.success) {
      Prefs.setString("token", result.data.toString());
      openPage(context, HomePageMD(title: "Sample Flutter"),
          replace: true);
    } else {
      DialogsHelper.messageDialog(result.errorMessage, context);
    }

//    FutureBuilder<ResponseResult>(
//      future: post("auth", params),
//      builder: (context, snapshot){
//
//        var result = snapshot.data as ResponseResult;
//
//        if (result.success) {
//          Prefs.setString("token", result.data.toString());
//          openPage(context, HomePageDrawer(title: "Sample Flutter Drawer"), replace: false);
//        } else {
//          DialogsHelper.messageDialog(result.errorMessage, context);
//        }
//
//        return null;
//      },
//    );


    setState(() {
      showProgress = false;
    });

  }
}
