import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';
import 'package:news/Model/LayoutModel.dart';
import 'package:news/Pages/detailsPage.dart';


class BusinessNews extends StatelessWidget {

  List<LayoutModel> layoutModel;
  BusinessNews(this.layoutModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, int index){
        return createViewItem(context, layoutModel[index]);
      },
      itemCount: layoutModel.length,
    );
  }

  Widget createViewItem(BuildContext context, LayoutModel layoutModel){
    return Container(
      height: 250.0,
      child: Card(
        child: InkWell(
          onTap: (){
            var route = new MaterialPageRoute(builder: (BuildContext context)=>
            new DetailsPage(value: layoutModel));
            Navigator.of(context).push(route);
          },
          child: Column(
            children: <Widget>[
              new Container(
                height: 140.0,
                child: Image.asset(layoutModel.image, fit: BoxFit.cover,),
              ),
              new Container(
                width: 200.0,
                height: 60.0,
                alignment: Alignment.topLeft,
                child: Text(
                  layoutModel.title,style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                width: 200,
                alignment: Alignment.topLeft,
                child: Text(layoutModel.source),
              ),
              new Container(
                width: 200.0,
                alignment: Alignment.topLeft,
                child: Text(layoutModel.duration),
              )
            ],
          ),
        ),
      ),
    );
  }
}

