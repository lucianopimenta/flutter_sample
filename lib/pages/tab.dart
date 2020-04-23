import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar Sample"),
            bottom: TabBar(tabs: <Widget>[
              Tab(text: "Tab1", icon: Icon(Icons.error),),
              Tab(text: "Tab2",icon: Icon(Icons.access_alarms)),
              Tab(text: "Tab3",icon: Icon(Icons.adb)),
            ],),
          ),
          body: TabBarView(children: <Widget>[
            Center(child: Container(child: Text("Conteúdo da Tab 1"), padding: EdgeInsets.all(16),)),
            Center(child: Container(child: Text("Conteúdo da Tab 2"), padding: EdgeInsets.all(16),)),
            Center(child: Container(child: Text("Conteúdo da Tab 3"), padding: EdgeInsets.all(16),)),
          ],

          ),
        ),
    );
  }
}
