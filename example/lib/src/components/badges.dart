// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sdx_flutter/sdx_flutter.dart';

class Badges extends StatefulWidget {
  @override
  State<Badges> createState() => _BadgesState();
}

class _BadgesState extends State<Badges> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Badges",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            height: 45,
            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              indicatorPadding: EdgeInsets.all(5),
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                color: Colors.white,
              ),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Intro',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Developers',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                introPage(),
                devPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget introPage() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Badges are small and subtle notification indicators used to provide users with additional information without disrupting their experience.",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "They can be used to indicate unread emails, changes to settings, and prompting actions such as refreshing as a page.",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SdxBadges(
                badgeContent: Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                position: BadgePosition.topEnd(),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.blue[800],
                  size: 28,
                ),
                showBadge: true,
              ),
              SizedBox(
                width: 30,
              ),
              SdxBadges(
                badgeContent: Text(
                  '9',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.blue[800],
                  size: 28,
                ),
                showBadge: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget devPage() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: SdxBadges(
              badgeContent: Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              position: BadgePosition.topEnd(),
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.blue[800],
                size: 28,
              ),
              showBadge: true,
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              color: Colors.black,
              child: Text(
                "SdxBadges(\n    badgeContent: Text(\"3\"),\n    child: Icon(SdxIcon.account)\n}",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
