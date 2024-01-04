// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, sort_child_properties_last, duplicate_ignore, file_names, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, camel_case_types, unused_field, unnecessary_null_comparison, unnecessary_new, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/AboutUs_widgets.dart';
import '../themes/style.dart';

class About_Us extends StatefulWidget {
  About_Us({super.key});

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  var Articless = {
    "A1":
        "Insaaf99.com provides a legal platform to general public to meet with the best legal professionals who have collaborated with Insaaf99.com to render their services in providing online consultation to illustrate about the laws of the Country and simplify them for the basic understanding of gullible citizens.",
    "A2":
        "Insaaf99.com has been started with the basic aim to introduce the eloquent and intellectual legal professionals with the citizens of the Country and shed some light on the complicated legal problems which are being faced by the citizens in their day to day life.",
    "A3":
        "Insaaf99.com endeavours to provide the general public with the elementary knowledge about the laws prevailing in the Country and their interpretation from the best legal professionals practicing and possessing thorough legal knowledge.",
    "A4":
        "Insaaf99.com has an objective to connect the general public to know about their legal rights and duties in case they face any legal tussle in their lives which would include but are not limited to matrimonial laws, contract laws, civil laws, criminal laws, intellectual property rights, constitution of the India and the powers provided by it to the Government and the citizens of India, Negotiable Instruments Act, Arbitration Laws, Mediation process to resolve matters amicably and other Alternate Dispute Resolutions methods, Consumer Rights etc.",
    "A5":
        "We at Insaaf99.com strive to give legitimate consultation through our team of legal professionals who have enrolled with us and volunteered to assist in explaining the legal terminology and process to the general public who are eager to understand about the laws of the Country.",
    "A6":
        "We're here to help you find the right legal Solutions. Insaaf 99 is developed by JKM Global Services to promote better access to legal Solutions. We are set up to give platform to people at large for sound and impartial Legal advice from the experienced, High rated, Verified Legal Experts at just Rs.99.",
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
          backgroundColor: themeBG2,
          title: Text("About US",
              maxLines: 1, style: GoogleFonts.alike(fontSize: 15.0))),
      body: ListView(
        scrollDirection: Axis.vertical,
        //  shrinkWrap: true,
        children: [
          bookSlot(
              context,
              "about_us_bg.jpg",
              "About Us",
              "Platform for Online Legal Consultation.",
              "A perfect platform for public at large where India's best legal experts collaborated with Insaaf99.com to provide online free legal consultation.",
              SizedBox()),
          //// Auto text Slide
          marquee(
            context,
          ),
          //// code for book your slot
          Detail_text(context, Articless),
        ],
      ),
    );
  }
}
