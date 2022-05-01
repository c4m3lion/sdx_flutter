// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: ListView(
        controller: ScrollController(),
        children: [
          Text(
            "Buttons",
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

                Tab(
                  text: 'Designers',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Developers',
                ),
              ],
            ),
          ),
          Container(
            width: 500,
            height: 500,
            child: TabBarView(
              controller: tabController,
              children: [
                introPage(),
                designerPage(),
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
            "Buttons are graphical control elements that provide users a triggered event. They must contain a clear actionable text and may additionally contain icons. Buttons are more visually dominant than text links. They guide the user through the content as a visual highlight and act as \"call to action\".",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => {},
                child: Text("Secondary Button"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue[800]),
                onPressed: () => {},
                child: Text("Primary Button"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget designerPage() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            children: [],
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
              child: SizedBox()),
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
