// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unnecessary_new, prefer_collection_literals, unused_element, unnecessary_null_comparison, missing_required_param

import 'dart:convert';
import '../../../Modal/modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_html_css/simple_html_css.dart';

import '../../themes/style.dart';

class NewsViewPage extends StatefulWidget {
  const NewsViewPage({required this.NewsID, required this.Title}) : super();
  final NewsID;
  final Title;
  static const routee = '/newview-page';
  @override
  State<NewsViewPage> createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  //get News Articles  Shedu  +++++++++++++++++++++++++++++++++++++++++++++++
  Map<dynamic, dynamic> NewsDat = new Map();
  _fnGetNews() async {
    NewsDat = {};
    dynamic jsonBody = {
      "sql":
          "SELECT * FROM `news` WHERE id = '${widget.NewsID}' ORDER BY id DESC ",
    };

    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'raw_query');

    if (returnData != null && returnData['success'] != null) {
      if (returnData['returnVal'].isNotEmpty) {
        setState(() {
          NewsDat = returnData['returnVal'].asMap();
        });
      }
    }
  }

  /////===========================================================================

  @override
  void initState() {
    _fnGetNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: themeBG2,
            title: Text("${widget.Title}",
                maxLines: 1, style: GoogleFonts.alike(fontSize: 15.0))),
        body: SafeArea(
            child: Container(
                child: (NewsDat.isNotEmpty)
                    ? ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          // themeHeader(context, title: "News View"),
                          Headline_view(
                            context,
                            NewsDat[0]["image"],
                            NewsDat[0]["news_cat"],
                            NewsDat[0]["expert"],
                            NewsDat[0]["adding_date"],
                            NewsDat[0]["descreption"],
                          ),
                        ],
                      )
                    : Center(child: progress()))));
  }

  Widget Headline_view(
    BuildContext context,
    image,
    headlines,
    experts,
    Newsdate,
    Newsdesc,
  ) {
    // // or use HTML.toRichText()
    final TextSpan textSpan = HTML.toTextSpan(
      context,
      Newsdesc,
      linksCallback: (dynamic link) {
        debugPrint('You clicked on ${link.toString()}');
      },
      // as name suggests, optionally set the default text style
      defaultTextStyle: TextStyle(color: Colors.black54),
      overrideStyle: <String, TextStyle>{
        'div': const TextStyle(
            color: Colors.black87,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-Regular'),
        'li': const TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Montserrat-Regular'),
        'h1': const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-Regular'),
        'p': const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat-Regular'),
        'strong': const TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-Regular'),
        'pre': const TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
            fontFamily: 'Montserrat-Regular'),
      },
    );
    return Container(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            "https://insaaf99.com/uploads/news/$image",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: themeBG2,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$headlines",
                  style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Text("$experts",
                  style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  )),
              Text("$Newsdate",
                  style: GoogleFonts.alike(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: RichText(text: textSpan),
        ),
        // Text("$Newsdesc")
      ]),
    );
  }
}//////close