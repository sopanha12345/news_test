import 'package:flutter/material.dart';
import 'package:flutter_html/rich_text_parser.dart';
import 'package:news/Model/HttpLayoutModel.dart';
import 'package:news/Model/LayoutModel.dart';
import 'package:news/Pages/HttpDetailPage.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news/Pages/detailsPage.dart';

class NewsLayout extends StatelessWidget {

  List<ProcheaPreyHttp> httpLayoutModel;
  NewsLayout(this.httpLayoutModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int index){
        return createViewItem(context, httpLayoutModel[index]);
      },
      itemCount: httpLayoutModel.length,
    );
  }

  Widget createViewItem(BuildContext context, ProcheaPreyHttp httpLayoutModel){
    return Container(
      height: 250.0,
      child: Card(
        child: InkWell(
          onTap: (){
            var route = new MaterialPageRoute(builder: (BuildContext context) =>
            new HttpDetailPage(value: httpLayoutModel));
            Navigator.of(context).push(route);
          },
          child: Column(
            children: <Widget>[
              new Container(
                  height: 100.0,
                  child: Image.network(
                    httpLayoutModel.fimg_url,
                    fit: BoxFit.fill,
                  )),
              new Container(
                width: 200.0,
                height: 90,
                alignment: Alignment.topLeft,
                child: Html(data:
                  httpLayoutModel.title.rendered,customTextStyle:(node,TextStyle baseStyle){
                  return baseStyle.merge(TextStyle(fontWeight: FontWeight.bold));
                }),
              ),
//              new Container(
//                width: 200.0,
//                alignment: Alignment.topLeft,
//                child: Html(data: httpLayoutModel.excerpt.rendered,customTextStyle:(node,TextStyle baseStyle){
//                  return baseStyle.merge(TextStyle(fontSize: 11,height: 2));
//                }),
//              ),
//              new Container(
//                width: 200.0,
//                alignment: Alignment.topLeft,
//                child: Text(httpLayoutModel.destination),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
