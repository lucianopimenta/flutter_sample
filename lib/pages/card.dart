import 'package:flutter/material.dart';
import 'package:fluttersample/helper/helper.dart';
import 'package:fluttersample/model/item.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

return Scaffold(
      appBar: AppBar(
        title: Text("Card no ListView"),
      ),
      body: _body()
    );
  }

  _body(){
    List<Item> carros = [
      Item(1, "https://3.bp.blogspot.com/-33mUdIWJYJ4/UJTknZ6WF9I/AAAAAAAAkWs/Fkxjv4ONeMk/s1600/clio4.jpg", "Clio", "Renault Clio 1.0 - 2019"),
      Item(2, "https://hyundai.itavema.com.br/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/b/hb20-1.jpg", "HB20", "Novo HB20 - 2020"),
      Item(3, "https://www.vw.com.br/content/dam/vw-ngw/vw_pkw/importers/br/models/my19/gol/highlights/Highlight_Gol_16x9_1216x684px_02A.jpg/_jcr_content/renditions/original.transform/max/img.jpg", "Gol", "VW Gol G& - 2019"),
      Item(4, "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiuBuyib-idfu-s7o1-PRCLG4kCK98GaPk2fM8Mx6FReATNvAD&usqp=CAU", "KA", "Ford KA 1.0 - 2020"),
      Item(5, "https://http2.mlstatic.com/disco-de-freio-ventilado-fiat-uno-vivace-uno-way-2010-D_NQ_NP_819559-MLB31737233830_082019-F.jpg", "Uno", "FIAT Uno Vivace - 2019"),
    ];

    return ListView.builder(
            itemCount: carros.length,
            itemBuilder: (BuildContext context, int index) {
              Item carro = carros[index];

              return Card(
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.only(top: 5, right: 16, bottom: 5, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: Image.network(carro.urlImage, width: 250,),),
                        Text(carro.title, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                        Text(carro.subTitle, style: TextStyle(fontSize: 12),),
                        ButtonBarTheme(
                          data: ButtonBarTheme.of(context),
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Icon(Icons.details),
                                onPressed: () { DialogsHelper.messageDialog("Botão de detalhes...", context); },
                              ),
                              FlatButton(
                                child: const Icon(Icons.share),
                                onPressed: () { DialogsHelper.messageDialog("Botão de compartilhar...", context); },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              );
            },
          );
  }
}
