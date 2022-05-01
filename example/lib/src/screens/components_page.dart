// ignore_for_file: prefer_const_constructors

import 'package:example/src/components/badges.dart';
import 'package:example/src/components/buttons.dart';
import 'package:example/src/components/rive_page.dart';
import 'package:flutter/material.dart';

class SdxComponentPage extends StatefulWidget {
  const SdxComponentPage({Key? key}) : super(key: key);

  @override
  State<SdxComponentPage> createState() => SdxComponentPageState();
}

class SdxComponentPageState extends State<SdxComponentPage> {
  int selectedPageId = 0;
  Widget currentPage = Container();

  void selectPage(int id) {
    selectedPageId = id;
    switch (selectedPageId) {
      case 0:
        currentPage = Badges();
        break;
      case 1:
        currentPage = ButtonsPage();
        break;
      case 2:
        currentPage = RivePage();
        break;
      default:
        currentPage = Badges();
    }
    setState(() {});
  }

  @override
  void initState() {
    selectPage(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
      ),
    );
  }

  Widget _buildWideContainers() {
    return Scaffold(
      body: Row(
        children: [
          buildDrawer(),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: currentPage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNormalContainer() {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: currentPage,
      ),
      drawer: buildDrawer(),
    );
  }

  Widget buildDrawer() {
    return Container(
      color: Colors.white,
      width: 220,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Swisscom components',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ExpansionTile(
            title: Text(
              'Components',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(
                selected: 0 == selectedPageId,
                title: Text('Badges'),
                onTap: () {
                  selectPage(0);
                },
              ),
              ListTile(
                selected: 1 == selectedPageId,
                title: Text('Buttons'),
                onTap: () {
                  selectPage(1);
                },
              ),
              ListTile(
                selected: 2 == selectedPageId,
                title: Text('Rive Animations'),
                onTap: () {
                  selectPage(2);
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Principles',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(
                title: Text('This is tile number 1'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Foundation',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ListTile(
                title: Text('This is tile number 1'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
