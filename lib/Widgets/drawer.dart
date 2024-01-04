// ignore_for_file: prefer_const_constructors, missing_required_param, non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, unused_field, unnecessary_new, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, unused_import, library_private_types_in_public_api, prefer_collection_literals, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:insaaf99bareact/Widgets/globle_widgets.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/about_us.dart';
import '../Screens/homepage.dart';

//import '../themes/style.dart';

bool isWeb() {
  return kIsWeb;
}

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  // logut

  bool _isShown = true;

  @override
  void initState() {
    super.initState();
    // _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
              //image: DecorationImage(image: AssetImage("assets/images/sll2.jpg"),fit: BoxFit.fill)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/law_logo.png'),
                          radius: 50,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        GoogleText(
                            text: 'Insaaf99 Laws',
                            fsize: 18.0,
                            fweight: FontWeight.bold)

                        // Container(
                        //   width: 150,
                        //   child: Row(children: [
                        //   TextButton(onPressed: (){}, child: Text("Login", style: themeTextStyle(
                        //         size: 13,
                        //         color: Colors.white,
                        //         fw: FontWeight.bold))),
                        //      TextButton(onPressed: (){}, child: Text("Login", style: themeTextStyle(
                        //         size: 13,
                        //         color: Colors.white,
                        //         fw: FontWeight.bold))),

                        //   ],),
                        // )
                      ]),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, color: Colors.black),
            title: Text(
              'Home',
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.error_outline, color: Colors.black),
            title: Text(
              'About Us',
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => About_Us(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.work_history_outlined, color: Colors.black),
            title: Text(
              'Student Corner',
            ),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => StudentCorner(),
              //     ));
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt_1_outlined, color: Colors.black),
            title: Text(
              'Contact Us',
            ),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => Contact_Us(),
              //     ));
            },
          ),
        ],
      ),
    );
    // }
  }
}

//????????????  MyDrawer  ++++++++++++++++++++++++++++++++++++++++++++++

Widget themeHeaderHome(
  context, {
  user = '',
  title = '',
}) {
  // navigation
  _fnLogin() {
    // Navigator.push(context, SlideRightRoute(page: loginNow()));
  }

  // signup
  _fnSignup() {
    // Navigator.push(context, SlideRightRoute(page: SigninPage()));
  }

  return Container(
    child: Stack(
      children: <Widget>[
        Opacity(
          opacity: 1,
          child: ClipPath(
            clipper: TsClip1(),
            child: Container(
              color: Color(0XFFf86ead),
              // color: themeBG3,
              height: 130.0,
            ),
          ),
        ),
        ClipPath(
          clipper: TsClip2(),
          child: Container(
            color: Color(0XFFe51273),
            //  color: themeBG2,
            height: 130.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 40.0, left: 10.0, right: 10.0),
              child: Container(
                child: Center(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        //  width: MediaQuery.of(context).size.width * 0.5,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 6.0),
                                child: Image.asset(
                                  'assets/images/mobile_logo1.png',
                                  width: 50,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "$title",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat",
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      (user.isEmpty)
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // crossAxisAlignment:
                                //     CrossAxisAlignment.start,
                                children: [
                                  themeButton3(context, _fnLogin,
                                      fontSize: 13.0,
                                      label: 'Login',
                                      buttonColor: Color.fromARGB(255, 0, 0, 0),
                                      radius: 5.0,
                                      borderColor: Colors.black,
                                      btnHeightSize: 30.0,
                                      btnWidthSize: 60.0),
                                  SizedBox(width: 10.0),
                                  themeButton3(context, _fnSignup,
                                      fontSize: 13.0,
                                      label: 'Signup',
                                      buttonColor: Color.fromARGB(255, 0, 0, 0),
                                      radius: 5.0,
                                      borderColor: Colors.black,
                                      btnHeightSize: 30.0,
                                      btnWidthSize: 60.0),
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 15),
                              // width:
                              //     MediaQuery.of(context).size.width * 0.6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 13.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            (user != '')
                                                ? Text(
                                                    "Hello, ${user['fname']}",
                                                    textAlign: TextAlign.end,
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.white),
                                                  )
                                                : SizedBox(),
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: (user == null ||
                                            user == '' ||
                                            user.isEmpty)
                                        ? SizedBox()
                                        : CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                '${user['avatar']}'),
                                            radius: 25.0,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class TsClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height - 50); //start path with this if you are making at bottom
    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 1.8, size.height - 40.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy - 10, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 4), size.height - 60);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 40);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TsClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height - 50); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 1.8, size.height - 40.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy - 10, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 4), size.height - 70);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 55);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
