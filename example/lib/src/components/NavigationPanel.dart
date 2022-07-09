import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 220,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
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
                title: Text('Badges'),
                onTap: () {
                },
              ),
              ListTile(
                title: Text('Buttons'),
                onTap: () {
                },
              ),
              ListTile(
                title: Text('Rive Animations'),
                onTap: () {
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
