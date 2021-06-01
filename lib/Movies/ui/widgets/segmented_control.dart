import 'package:flutter/cupertino.dart';

class SegmentedControl extends StatefulWidget {
  @override
  State createState() => SegmentedControlState();
}

class SegmentedControlState extends State<SegmentedControl> {
  final Map<int, Widget> children = const <int, Widget>{
    0: Text('Top Rated'),
    1: Text('My favorites'),
  };

  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<int>(
      selectedColor: Color.fromRGBO(113, 125, 248, 1),
      unselectedColor: Color.fromRGBO(239, 241, 255, 1),
      children: children,
      onValueChanged: (int newValue) {
        setState(() {
          currentValue = newValue;
        });
      },
      groupValue: currentValue,
    );
  }
}