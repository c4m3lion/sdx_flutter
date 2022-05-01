import 'package:flutter/material.dart';
import 'package:sdx_flutter/sdx_flutter.dart';

class Accordion extends StatefulWidget {
  const Accordion({Key? key}) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  late List<ListItem> _items;
  List<ListItem> generateItems(int numberOfItems) {
    return List<ListItem>.generate(numberOfItems, (int index) {
      return ListItem(
        id: index,
        headerName: 'Expansion Panel $index',
        description: 'This is body of item number $index',
      );
    });
  }

  List<ExpansionPanel> _getExpansionPanels(List<ListItem> _items) {
    return _items.map<ExpansionPanel>((ListItem item) {
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(item.headerName),
          );
        },
        body: ListTile(
          title: Text(item.description),
        ),
        isExpanded: item.isExpanded,
      );
    }).toList();
  }

  @override
  void initState() {
    _items = generateItems(15);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 200,
          width: 200,
          child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 2000),
            children: _getExpansionPanels(_items),
            expansionCallback: (panelIndex, isExpanded) {
              _items[panelIndex].isExpanded = !isExpanded;
              setState(() {});
            },
          )),
    );
  }
}

class ListItem {
  int id;
  String headerName;
  String description;
  bool isExpanded;

  ListItem({
    this.id = -1,
    this.headerName = "test",
    this.description = "test",
    this.isExpanded = false,
  });
}
