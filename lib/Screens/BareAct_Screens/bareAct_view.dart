// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, file_names, unused_import, unnecessary_new, prefer_collection_literals, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, dead_code, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, use_build_context_synchronously, await_only_futures

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../themes/style.dart';
import '../../Widgets/globle_widgets.dart';
import '../../themes/slide_transition.dart';
import 'details_view.dart';
import '../../../Modal/modal.dart';

class BareActView extends StatefulWidget {
  const BareActView({@required this.id, @required this.BareActName}) : super();
  final id;
  final BareActName;
  @override
  State<BareActView> createState() => _BareActViewState();
}

class _BareActViewState extends State<BareActView> {
  int bottomNavSelectedPage = 0;
  int selectedPage = 0;

  bool detail = false;

  ///////user
  Map<dynamic, dynamic> user = new Map();
  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic userData = (prefs.getString('user'));
    if (userData != null) {
      setState(() {
        user = jsonDecode(userData) as Map<dynamic, dynamic>;
        //  print("${user['name']}");
        _fnGetBareActsDetails(widget.id);
      });
    }
  }

//get Bare Act Titles ++

  Map<dynamic, dynamic> BareActDetails = new Map();
  _fnGetBareActsDetails(idCat) async {
    dynamic jsonBody = {
      "sql":
          "SELECT id, title, section_range FROM `act_sub_category` WHERE `category_id` = '$idCat'",
    };
    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'raw_query');
    if (returnData != null && returnData['success'] != null) {
      if (returnData['returnVal'].isNotEmpty) {
        setState(() {
          BareActDetails = returnData['returnVal'].asMap();
          //print("$BareActDetails  +++++++++++");
        });
      }
    }
  }

//get Bare Act Titles ++

  Map<dynamic, dynamic> BareActMoreDetails = new Map();

  String subCatID = "";
  _fnGetBareActsMoreDetails(idSubCat) async {
    BareActMoreDetails = {};
    dynamic jsonBody = {
      "sql": "SELECT * FROM `acts` WHERE `sub_category_id` = '$idSubCat'",
    };
    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'raw_query');
    if (returnData != null && returnData['success'] != null) {
      if (returnData['returnVal'].isNotEmpty) {
        BareActMoreDetails = returnData['returnVal'].asMap();
        for (var i = 0; i < BareActMoreDetails.length; i++) {
          subCatID = "${BareActMoreDetails[i]["sub_category_id"]}";
          var subcaturl = "${BareActMoreDetails[i]["slug_url"]}";
        }

        setState(() {});
      }
    }
  }

  @override
  void initState() {
    _getUser();
    _fnGetBareActsDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: themeBG2,
            title: GoogleText(
                text: "${widget.BareActName}",
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
              // themeHeader(context, title: "Bare Acts Details"),
              (BareActDetails.isEmpty)
                  ? Center(child: pleaseWait(context))
                  : page_body(context),
              SizedBox(
                height: 40,
              ),
              // footer_txt(context)
            ],
          ),
        )
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topLeft: Radius.circular(20))),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(children: [
        for (var row = 0; row < BareActDetails.length; row++)
          Con_Details(
              context,
              "${BareActDetails[row]["title"]}",
              "${BareActDetails[row]["section_range"]}",
              "${BareActDetails[row]["id"]}"),
      ]),
    );
  }

  Widget Con_Details(BuildContext context, title, articles, catID) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (detail == false) {
              setState(() {
                detail = true;
                _fnGetBareActsMoreDetails(catID);
              });
            } else {
              setState(() {
                detail = false;
                BareActMoreDetails = {};
              });
            }
          },
          child: Container(
              decoration: BoxDecoration(
                boxShadow: themeBox,
              ),
              margin: EdgeInsets.only(top: 15, right: 10, left: 10),
              //margin: EdgeInsets.symmetric(vertical: 10,horizontal:10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            "$title",
                            style: themeTextStyle(
                                color: themeBG2,
                                size: 16.0,
                                fw: FontWeight.bold,
                                ftFamily: 'ms'),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "$articles",
                        style: themeTextStyle(
                            color: themeBG,
                            size: 16.0,
                            fw: FontWeight.bold,
                            ftFamily: 'ms'),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (detail == false) {
                            setState(() {
                              detail = true;
                            });
                            _fnGetBareActsMoreDetails(catID);
                          } else {
                            setState(() {
                              detail = false;
                              BareActMoreDetails == null;
                            });
                          }
                        });
                      },
                      icon: (detail != false && catID == subCatID)
                          ? Icon(Icons.arrow_drop_down,
                              size: 50, color: themeBG)
                          : Icon(Icons.arrow_forward_ios_outlined,
                              size: 25, color: themeBG2))
                ],
              )),
        ),

        ////// details  ____________________________________
        (detail != false && (subCatID != null && catID == subCatID))
            ? Con_MoreDetails(context)
            : SizedBox()
      ],
    );
  }

  Widget Con_MoreDetails(BuildContext context) {
    return (BareActMoreDetails != null)
        ? Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: themeBox,
              borderRadius: BorderRadius.circular(10),
              color: themeBG2,
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < BareActMoreDetails.length; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          SlideRightRoute(
                            page: DetailsViews(
                                title: "${BareActMoreDetails[i]["title"]}",
                                desc: "${BareActMoreDetails[i]["descreption"]}",
                                url: "${BareActMoreDetails[i]["slug_url"]}"),
                          ));
                    },
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width - 90,
                            child: GoogleText(
                                text: "${BareActMoreDetails[i]["title"]}",
                                color: Colors.white,
                                fweight: FontWeight.bold,
                                fsize: 14.0)),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
              ],
            ),
          )
        : SizedBox();
  }
}//////close