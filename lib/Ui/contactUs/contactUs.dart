import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Helpers/Helper.dart';
import '../../constant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

const _urlWebSite = 'https://www.cifet.org/';
const _youtube = 'https://www.youtube.com/channel/UC-sNuUtjXYxWORGD8FW0HTw';
const _facebook = 'fb://facewebmodal/f?href=https://www.facebook.com/cifetofficial';
const _instgram = 'https://www.instagram.com/cifet.festival/';
const _mobilephone = 'tel:+027364535';
const _mail =
    'mailto:info@cifet.org?subject=This is Subject Title&body=This is Body of Email';



class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backGroundDecoration(),
      child: Scaffold(
        appBar: customAppBar(Helper.IsArabic?"تواصــل معنا":"Contact Us", context, false),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),

                SizedBox(
                  height: 40,
                ),
                customTxt(Helper.IsArabic?"مقر المهرجان":"Festival Address", Colors.white),
                SizedBox(
                  height: 10,
                ),
                customTxt(
                   Helper.IsArabic?"الدور الثاني - مبني قطاع الانتاج الثقافي \n ساحة دار الاوبرا المصرية":
                    "Cultural Production Affairs Sector \n Cairo Opera House",
                    Colors.white),
                SizedBox(
                  height: 30,
                ),
                customContactRow(Helper.IsArabic?"للتواصــل من خلال البريد الالكترونى":"Email",
                    FontAwesomeIcons.mailBulk, _mail,No: true),
                SizedBox(
                  height: 10,
                ),
                customContactRow(Helper.IsArabic?"للتواصل من خلال الاتصال":"Call",
                    FontAwesomeIcons.phone, _mobilephone,No: true),
                SizedBox(
                  height: 10,
                ),
                customContactRow(Helper.IsArabic?"لمتابعة الموقع الاليكترونى":"WebSite",
                    FontAwesomeIcons.chrome, _urlWebSite),
                SizedBox(
                  height: 10,
                ),
                customContactRow(Helper.IsArabic?"لمتابعة صفحة الفيس بوك":"Facebook",
                    FontAwesomeIcons.facebook, _facebook),
                SizedBox(
                  height: 10,
                ),
                customContactRow(Helper.IsArabic?"لمتابعة حساب الانتسجرام":"Instagram"
                    "",
                    FontAwesomeIcons.instagram, _instgram),
                SizedBox(
                  height: 10,
                ),
                customContactRow(Helper.IsArabic?"لمتابعة قناة اليوتيوب":"Youtube",
                    FontAwesomeIcons.youtube, _youtube),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
