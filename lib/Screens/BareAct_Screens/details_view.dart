// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, file_names, unused_import, unnecessary_new, prefer_collection_literals, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:social_share/social_share.dart';
import '../../Widgets/globle_widgets.dart';
import '../../themes/slide_transition.dart';
import '../../themes/style.dart';
import 'bareAct_view.dart';

class DetailsViews extends StatefulWidget {
  const DetailsViews(
      {@required this.title, @required this.desc, @required this.url})
      : super();
  final title;
  final desc;
  final url;
  @override
  State<DetailsViews> createState() => _DetailsViewsState();
}

class _DetailsViewsState extends State<DetailsViews> {
  int bottomNavSelectedPage = 0;
  int selectedPage = 0;
  Map<dynamic, dynamic> user = new Map();

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic userData = (prefs.getString('user'));
    if (userData != null) {
      setState(() {
        user = jsonDecode(userData) as Map<dynamic, dynamic>;
        // //  print("${user['name']}");
        // _fnGetBareActs();
      });
    }
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeBG2,
          title: GoogleText(
              text: "Bare Act Details",
              color: Colors.white,
              fsize: 15.0,
              fweight: FontWeight.bold)),
      // PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: clientAppBar(),
      // ),
      body: Container(
        child: ListView(
          children: [
            // themeHeader(context, title: "Act Details"),
            Container(
              child: Stack(
                children: [
                  Positioned(
                      right: 10.0,
                      top: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          SocialShare.shareOptions(
                                  "https://insaaf99.com/student-corner/bare-acts/detail/${widget.url}")
                              .then((data) {
                            print("${widget.url}   ++++=========+++++");
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 60, 150, 123),
                              borderRadius: BorderRadius.circular(50.0)),
                          width: 45.0,
                          height: 45.0,
                          child: Icon(
                            Icons.share,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  page_body(context),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
            //   footer_txt(context)
          ],
        ),
      ),
      // floatingActionButton: (user['type'] != 'lawyer')
      //     ? themeFloatButton(context, 'Consult A Lawyer',
      //         fn: _fnConsultLawyer,
      //         myIcon: Icons.person_add,
      //         myColor: themeBG4)
      //     : SizedBox(),
      // bottomNavigationBar: (user.isNotEmpty && user != null)
      //     ? (user['type'] == 'client')
      //         ? bottomNavBar(context, bottomNavSelectedPage)
      //         : bottomNavBar_Lawyer(context, selectedPage)
      //     : SizedBox()
    );
  }

  Widget page_body(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Text(widget.id),
            Text(
              widget.title,
              style: themeTextStyle(
                  size: 18,
                  color: themeBG,
                  ftFamily: 'ms',
                  fw: FontWeight.bold),
            ),
            Divider(
              thickness: 2,
              color: themeBG2,
            ),
            SizedBox(
              height: 20,
            ),
            Acts_con(context)
          ]),
    );
  }

  Widget Acts_con(BuildContext context) {
    final TextSpan textSpan = HTML.toTextSpan(
      context,
      widget.desc,
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
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Montserrat-Regular'),
        'h1': const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-Regular'),
        'h2': const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-Regular'),
        'h3': const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat-Regular'),
        'p': GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            color: Colors.black),
        // const TextStyle(
        //     color: Colors.black,
        //     fontSize: 16.0,
        //     fontWeight: FontWeight.w500,
        //     fontFamily: 'Montserrat-Regular'),
        'ul': GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color(0xff1a243f)),
        // TextStyle(
        //     color: Color(0xff1a243f),
        //     fontSize: 16.0,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'Montserrat-Regular'),
        'u': GoogleFonts.lato(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color(0xff1a243f)),
        // TextStyle(
        //   color: Color(0xff1a243f),
        //   fontSize: 17.0,
        //   fontWeight: FontWeight.bold,
        //   fontFamily: 'Montserrat-Regular'),
        'strong': GoogleFonts.lato(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black)
        //  TextStyle(
        //     color: Colors.black,
        //     fontSize: 17.0,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'Montserrat-Regular'),
      },
    );
    return Container(
      decoration: BoxDecoration(
          boxShadow: themeBox, borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: RichText(text: textSpan),
    );
  }
} //////close
