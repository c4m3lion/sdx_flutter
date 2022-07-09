import 'package:example/src/components/NavigationPanel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(),
          body: Row(
            children: [
              SizedBox(
                child: constraints.maxWidth <= 600 ? null : NavigationPanel(),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SelectableText(
                      "All the basics",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SelectableText(
                        "The Swisscom Digital Experience (SDX) is Swisscom's design system and consists of a component library, UX principles, design guidelines, documentations and rules. It's a living style guide built for all designers and developers working for Swisscom."),
                    SizedBox(
                      height: 25,
                    ),
                    SelectableText(
                        "SDX is mandatory for all web apps or web sites (both external and internal) in order to ensure that all applications unmistakably embody the unique look and feel of Swisscom."),
                    GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        FlutterLogo(),
                        FlutterLogo(),
                        FlutterLogo(),
                        FlutterLogo(),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          drawer: constraints.maxWidth > 600 ? null : NavigationPanel(),
        );
      },
    ));
  }
}
