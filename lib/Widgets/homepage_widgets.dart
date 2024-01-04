// ignore_for_file: unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

PreferredSize appBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150),
    child: Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: _boxDecoration(),
      child: SafeArea(
        child: Column(
          children: [
            topBar(),
            const SizedBox(height: 5),
            _searchBox(),
            tabBar(),
          ],
        ),
      ),
    ),
  );
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    gradient: LinearGradient(
      colors: [Colors.white, Colors.teal.shade300],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

Widget topBar() {
  return Row(
    children: [
      const CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage('assets/images/law_logo.png'),
      ),
      const Expanded(
        child: Text(
          'Insaaf99 Bare Acts',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        backgroundImage: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/1200px-User_icon_2.svg.png'),
      )
    ],
  );
}

final TextEditingController _searchText = TextEditingController();
Widget _searchBox() {
  return SizedBox(
    height: 35,
    child: TextFormField(
      textAlign: TextAlign.start,
      controller: _searchText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: InkWell(
          child: const Icon(Icons.close),
          onTap: () {
            _searchText.clear();
          },
        ),
        hintText: 'Search...',
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ),
  );
}

Widget tabBar() {
  return TabBar(
    labelPadding: const EdgeInsets.all(0),
    labelColor: Colors.black,
    indicatorColor: Colors.black,
    unselectedLabelColor: Colors.teal.shade800,
    tabs: const [
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.balance),
        text: 'BARE ACTS',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.newspaper),
        text: 'LATEST NEWS',
      ),
      Tab(
        iconMargin: EdgeInsets.all(0),
        icon: Icon(Icons.menu),
        text: 'Menu',
      ),
    ],
  );
}

Widget tabBarViewItem(IconData icon, String name) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: 100,
      ),
      Text(
        name,
        style: const TextStyle(fontSize: 40),
      ),
    ],
  );
}
