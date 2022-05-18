import 'package:CIFET/Models/GridItemModel.dart';
import 'package:CIFET/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:CIFET/constant.dart';
import 'package:CIFET/styles/widthandheight.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Helpers/Helper.dart';
import 'Widgets/MenuItem.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*CollectionReference users = Firestore.instance.collection("users");

  getdata() {
    users.getDocuments().then((QuerySnapshot querySnapshot) {
      querySnapshot.documents.forEach((element) {
        print(element.data);
      });
    });
  }*/






  @override
  Widget build(BuildContext context) {
    //getdata();
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body:
        Container(child:
        Column(children: [
          Padding(
            padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),child:
          Container(height: 85,width: getwidth(context),

              child:


              Image.asset(Helper.IsArabic?"assets/imgar.png":"assets/imgen.png")

          )


            ,),






          FlatButton(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Container( alignment: Alignment.center,height: 25,color: !Helper.IsArabic?Colors.white:Colors.grey,child:
                Padding(padding: EdgeInsets.only(left: 30,right: 30),child:
                Text("English",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),))

                ,
                Container( alignment: Alignment.center,height: 25,color: Helper.IsArabic?Colors.white:Colors.grey,child:
                Padding(padding: EdgeInsets.only(left: 30,right: 30),child:


                Text("العربية",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                )

                )



              ],




              ),
              onPressed: () {
                Helper.sharedPreferences!.setBool("Lang", !Helper.IsArabic);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              }),


          Container(height: getheight(context)-140-MediaQuery.of(context).padding.top,child:



Directionality(child:
    StreamBuilder(stream: FirebaseFirestore.instance.collection("Items").where("LangType",whereIn: ["All",Helper.IsArabic?"Arabic":"English"]).where("IsActive",isEqualTo: true).orderBy("Index",descending: false).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if(snapshot.hasData) {

          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(snapshot.data!.docs.length, (index) {
              return MenuItemApp(GridItemModel.fromjson(snapshot.data!.docs[index]));


            }));}


    else{


      return Container();
      }
    }),textDirection:(Helper.IsArabic)? TextDirection.rtl:TextDirection.ltr,)







          )
        ],)

        ),
      ),
    );
  }
  void launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';}
}
