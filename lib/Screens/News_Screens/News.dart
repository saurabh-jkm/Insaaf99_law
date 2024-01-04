// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, file_names, unused_import, unnecessary_new, prefer_collection_literals, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, missing_required_param, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Controllers/bareAct_controller.dart';
import '../../themes/slide_transition.dart';
import '../../themes/style.dart';
import '../../../Modal/modal.dart';
import 'News_viewPage.dart';

////
Widget News_List_Widget(BuildContext context, News_data) {
  var barecontroller = new BareActController();
  barecontroller.bareActpage = false;

  ///
  return Container(
    height: MediaQuery.of(context).size.height * 1.70,
    child: ListView.builder(
        itemCount: News_data.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var tempData = News_data;
          return News_articles(
              context,
              "https://insaaf99.com/uploads/news/${tempData[index]["image"]}",
              "${tempData[index]["news_cat"]}",
              "${tempData[index]["adding_date"]}",
              "${tempData[index]["expert"]}",
              NewsViewPage(
                  NewsID: tempData[index]["id"],
                  Title: "${tempData[index]["news_cat"]}"));
        }),
  );
}

Widget News_articles(
    BuildContext context, imgs, head_text, date_text, Lead_3, Button_nav) {
  // print("${imgs.runtimeType}    +++++++++++++");
  return GestureDetector(
    onTap: () {
      Navigator.push(context, SlideRightRoute(page: Button_nav));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: const Offset(
            1.0,
            1.0,
          ),
          blurRadius: 1.0,
          // spreadRadius: 2.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(
            1.0,
            1.0,
          ),
          blurRadius: 1.0,
          // spreadRadius: 2.0,
        ), //BoxShadow
      ]
              //   color: Colors.white,
              ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(),
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.40,
              child: Image(
                image: NetworkImage("$imgs"),
                fit: BoxFit.fill,
              )
              //Image(image: AssetImage("assets/images/$imgs"),fit: BoxFit.fill,),
              ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.53,
                  child: Text(head_text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(date_text,
                    style: GoogleFonts.lato(
                        color: themeBG3,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(Lead_3,
                      style: GoogleFonts.lato(
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
//