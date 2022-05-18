import 'package:CIFET/constant.dart';
import 'package:flutter/material.dart';

import 'Helpers/Helper.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(Helper.IsArabic?"عن التطبــيق": "About App", context, false),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: 30,
                ),
                customTxt(
                    Helper.IsArabic?  "يحتوى التطبيق على  متابعة فعاليات \n مهرجان القاهرة الدولي للمسرح التجريبي":
                    "The Application Contains A Follow-up To The Events of Cairo International Festival for Experimental Theatre"
                    ,
                    Colors.white),
                SizedBox(
                  height: 30,
                ),
                Helper.IsArabic? customTxt(
                    "يشمل التطبيق على اخبار المهرجان والاصدارات والنشرات وجدول العروض والندوات والورش و معلومات عن فريق عمل المهرجان وصفحة الفيسبوك وحساب الانستجرام وقناة اليوتيوب الخاصة بالمهرجان\n كما يحتوى على اشعارات تصل للمستخدم على هاتفه لتنبيهه باحدث الاخبار وفعاليات المهرجان",
                    Colors.white):Container(),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Colors.red[800],
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    InkWell(onTap:(){


                      launchURL("fb://facewebmodal/f?href=https://www.facebook.com/mohamed.fadel.elkabany");

                    },child:
                    customTxt(
                       Helper.IsArabic? "مدير الموقع الالكتروني و السوشيال ميديا بالمهرجان"+"\n"+
                        "محمد فاضل القبانى":
                        "Website and social Media Manager"+"\n"+
                        "Mohamed Fadel Elkabany"
                        ,
                        Colors.white)
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Colors.red[800],
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: InkWell(onTap:(){


                      launchURL("fb://facewebmodal/f?href=https://www.facebook.com/trends4adv");

                    },child:
                    customTxt(
                        Helper.IsArabic?"تم تصميم التطبيق بواسطة\n  مؤسسة اتجاهات للاعلان":
                        "App Designed By Etgahat Agency",
                        Colors.white),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
