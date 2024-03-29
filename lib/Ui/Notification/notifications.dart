import 'package:CIFET/Helpers/Helper.dart';
import 'package:CIFET/styles/widthandheight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import '../../constant.dart';

class Notifications extends StatefulWidget {
  String CollectionName;
  String Title;
  Notifications(this.CollectionName,this.Title);
  @override
  _NotificationsState createState() => _NotificationsState();
}

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('yyyy-MM-dd');
final String formatted = formatter.format(now);


class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(widget.Title, context, false),
        backgroundColor: Colors.transparent,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection(widget.CollectionName).orderBy('Date',descending: true).snapshots(),

            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> Snap) {
              if (Snap.hasData) {

                return ListView.builder(
                    itemCount: Snap.data!.docs.length,itemBuilder: (context,index){
                  return
                    InkWell(onTap: ()async{

                      try{

                        launchURL(Snap.data!.docs[index].get("Link"));

                      }catch(E){

                      }


                    },child:Card(color: Colors.white.withOpacity(.8),elevation:4,child:


                    Padding(padding: EdgeInsets.all(8),child:
                    Container(width:getwidth(context),child:

                    ListTile(leading: Icon(Icons.notifications),title: Text(Snap.data!.docs[index].get("Title")



                      ,textAlign: TextAlign.right,style:TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    subtitle:
                    Text(Snap.data!.docs[index].get("Text")



                      ,textAlign: TextAlign.right,style:TextStyle(fontSize: 14,fontWeight: FontWeight.w500),))


                    )
                    )
                    )

                    );



                });}
              else{

                return CircularProgressIndicator();    }
            }





        )

      ),
    );
  }
}
