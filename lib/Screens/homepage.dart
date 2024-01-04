// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_final_fields, unused_field, sized_box_for_whitespace, unnecessary_new, avoid_print, unused_element, unnecessary_string_interpolations, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:insaaf99bareact/Screens/BareAct_Screens/bareAct.dart';
import 'package:insaaf99bareact/Widgets/globle_widgets.dart';
import 'package:insaaf99bareact/themes/style.dart';
import '../Controllers/bareAct_controller.dart';
import '../Controllers/news_controller.dart';
import '../Widgets/drawer.dart';
import '../../../Modal/modal.dart';
import 'News_Screens/News.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var barecontroller = new BareActController();
  var news_controller = new NeswController();
  final List<String> tabTitles = [
    'BARE ACTS',
    'LATEST NEWS',
  ];

/////// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  _fnGetBareActs() async {
    dynamic jsonBody = {
      "sql": " SELECT * FROM `act_category` WHERE `status` = '1'",
    };
    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'raw_query');
    if (returnData != null && returnData['success'] != null) {
      if (returnData['returnVal'].isNotEmpty) {
        setState(() {
          barecontroller.BareActData = returnData['returnVal'].asMap();
        });
        for (var i = 0; i <= barecontroller.BareActData.length; i++) {
          var data = await barecontroller.BareActData[i];
          if (data != null) {
            barecontroller.list.add(data);
          }
        }
      }
    }
  }

////===========================================================================
///////  Latest News ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  _fnGetAllNews() async {
    dynamic jsonBody = {
      "sql":
          "SELECT id, news_cat, descreption,expert,image, adding_date  FROM `news` WHERE `status` = '1' ORDER BY id DESC ",
    };
    var returnData =
        await themeModal.fnFindDynamic(context, jsonBody, action: 'raw_query');
    if (returnData != null && returnData['success'] != null) {
      if (returnData['returnVal'].isNotEmpty) {
        setState(() {
          news_controller.AllNewsData = returnData['returnVal'].asMap();
        });
      }
    }
  }
////===========================================================================

  @override
  void initState() {
    _fnGetBareActs();
    _fnGetAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeBG2,
          leading: Builder(builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                  margin: EdgeInsets.only(left: 10), child: Icon(Icons.menu)),
            );
          }),
          //IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: !barecontroller.searchBoolean
              ? GoogleText(
                  text: "Insaaf99 Laws", color: Colors.white, fsize: 20.0)
              : searchTextField(),
          actions: !barecontroller.searchBoolean
              ? [
                  (barecontroller.bareActpage == true)
                      ? IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              barecontroller.searchBoolean = true;
                              barecontroller.searchIndexList = [];
                            });
                          })
                      : SizedBox(),
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ]
              : [
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          barecontroller.searchBoolean = false;
                        });
                      }),
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ]),
      drawer: HeaderHome(),
      // appBar: appBar(),
      body: DefaultTabController(
        length: tabTitles.length,
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              // constraints: BoxConstraints(maxHeight: 100.0),
              child: TabBar(isScrollable: true, tabs: [
                Container(
                  width: 150,
                  child: Tab(
                      iconMargin: EdgeInsets.only(bottom: 5),
                      icon: Icon(Icons.balance),
                      child: GoogleText(
                          text: '${tabTitles[0]}',
                          color: Colors.white,
                          fweight: FontWeight.bold,
                          fsize: 13.0)),
                ),
                Container(
                  width: 150,
                  child: Tab(
                      iconMargin: EdgeInsets.only(bottom: 5),
                      icon: Icon(Icons.newspaper),
                      child: GoogleText(
                          text: '${tabTitles[1]}',
                          color: Colors.white,
                          fweight: FontWeight.bold,
                          fsize: 13.0)),
                ),
              ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  (!barecontroller.searchBoolean)
                      ? BareActs(context, barecontroller.BareActData)
                      : BareActs(context, barecontroller.searchIndexList),
                  News_List_Widget(context, news_controller.AllNewsData)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//// ====
  Widget searchTextField() {
    return TextField(
      onChanged: ((value) {
        _filterItems(value);
      }),
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  ///
  List finalProductList = [];
  void _filterItems(String query) {
    List<String> searchField = ['title'];
    // finalProductList = _list;
    barecontroller.searchIndexList = [];
    barecontroller.list.forEach((e) {
      bool isFind = false;
      searchField.forEach((key) {
        if (!isFind &&
            e['$key'] != null &&
            e['$key'].toLowerCase().contains(query.toLowerCase())) {
          barecontroller.searchIndexList.add(e);
          isFind = true;
        }
      });
    });
    setState(() {});
  }
  ////////////////////  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
