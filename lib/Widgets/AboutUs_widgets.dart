// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../themes/slide_transition.dart';
import '../themes/style.dart';

/////////////  Widget  Detailes Text +++++++++++++++++++++

Widget Detail_text(BuildContext context, Articless) => Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: themeBox,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: themeBG,
                child: Text(
                  "INSAAF99 ",
                  style: themeTextStyle(
                      color: Colors.black,
                      size: 20.0,
                      fw: FontWeight.bold,
                      ftFamily: 'ms'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Color.fromARGB(255, 110, 183, 243),
                child: Text(
                  "Need Online Legal Guidance?",
                  style: themeTextStyle(
                      color: Colors.black,
                      size: 16.0,
                      fw: FontWeight.w500,
                      ftFamily: 'ms'),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              "${Articless["A1"]}",
              style: themeTextStyle(
                  color: Colors.black87,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              "${Articless["A2"]}",
              style: themeTextStyle(
                  color: Colors.black87,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              "${Articless["A3"]}",
              style: themeTextStyle(
                  color: Colors.black87,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              "${Articless["A4"]}",
              style: themeTextStyle(
                  color: Colors.black87,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              "${Articless["A5"]}",
              style: themeTextStyle(
                  color: Colors.black87,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Text(
              "${Articless["A6"]}",
              style: themeTextStyle(
                  color: Colors.black87,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),
          ),
        ],
      ),
    );

/////////  Widget For slote Book++++++++++++++++++++++
Widget bookSlot(
    BuildContext context, img_banner, head_text, lead1, lead2, button_navigat) {
  return Column(
    children: [
      Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        height: 180,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
          image: AssetImage('assets/images/$img_banner'),
          fit: BoxFit.fill,
        )),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        //  height : MediaQuery.of(context).size.height*0.15,
        color: Color.fromARGB(255, 240, 230, 188),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              head_text,
              style: themeTextStyle(
                  color: Colors.black,
                  size: 22.0,
                  fw: FontWeight.bold,
                  ftFamily: 'ms'),
            ),
            SizedBox(height: 5.0),
            Text(
              lead1,
              style: themeTextStyle(
                  color: Colors.black,
                  size: 18.0,
                  fw: FontWeight.w600,
                  ftFamily: 'ms'),
            ),
            SizedBox(height: 10.0),
            Text(
              lead2,
              style: themeTextStyle(
                  color: Colors.black,
                  size: 16.0,
                  fw: FontWeight.w400,
                  ftFamily: 'ms'),
            ),

            // ignore: prefer_const_constructors
            SizedBox(height: 15.0),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, SlideRightRoute(page: button_navigat));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: themeBG),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                      child: Text(
                        "Book your Slot",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )))
          ],
        ),
      ),
    ],
  );
}
/////

//////////  Widget Auto Move Text ++++++++++++++++++++++++++

Widget marquee(BuildContext context) {
  return Container(
    color: Color(0xff1a243f),
    padding: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
    width: MediaQuery.of(context).size.width,
    height: 60.0,
    child: Marquee(
      text:
          '|    An Online Platform for Getting Legal Solutions .       |         An Online Platform for Getting Legal Solutions .         |          An Online Platform for Getting Legal Solutions .',
      // ignore: prefer_const_constructors
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      scrollAxis: Axis.horizontal, //scroll direction
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 10.0,
      velocity: 60.0, //speed
      pauseAfterRound: Duration(seconds: 1),
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    ),
  );
}
