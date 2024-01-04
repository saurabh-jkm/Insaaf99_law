// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_new, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:insaaf99bareact/Widgets/globle_widgets.dart';
import '../../themes/slide_transition.dart';
import '../../themes/style.dart';
import 'bareAct_view.dart';

Widget BareActs(BuildContext context, Bare_data) {
  return (Bare_data.isEmpty)
      ? Center(child: pleaseWait(context))
      : Container(
          child: ListView(children: [
            for (var row = 0; row < Bare_data.length; row++)
              Row(
                children: [
                  Expanded(
                      child: Con_Blog(
                          context,
                          "https://insaaf99.com/uploads/acts/${Bare_data[row]["image"]}",
                          "${Bare_data[row]["title"]}",
                          BareActView(
                              id: "${Bare_data[row]["id"]}",
                              BareActName: "${Bare_data[row]["title"]}"))),
                ],
              ),

            SizedBox(
              height: 40,
            ),
            //  footer_txt(context)
          ]),
        );
}

Widget Con_Blog(BuildContext context, imgs, lebal, _fn) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          SlideRightRoute(
            page: _fn,
          ));
    },
    child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: themeBox,
            borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(imgs), fit: BoxFit.fill)),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: themeBG2,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                alignment: Alignment.center,
                child:

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    GoogleText(
                        text: lebal,
                        fsize: 15.0,
                        fweight: FontWeight.bold,
                        color: Colors.white)
                //   ],
                // ),
                ),
          ],
        )),
  );
}
