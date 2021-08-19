import 'package:flutter/material.dart';


class Bottomtabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  Bottomtabs({this.selectedTab, this.tabPressed});

  @override
  _BottomtabsState createState() => _BottomtabsState();
}

class _BottomtabsState extends State<Bottomtabs> {
  int _selectedTabs;

  @override
  Widget build(BuildContext context) {
    _selectedTabs = widget.selectedTab ?? 0;

    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            blurRadius: 30,
            spreadRadius: 1,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabBtn(
              iconPath: Icons.home_outlined,
              selected: _selectedTabs == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.favorite,
              selected: _selectedTabs == 2 ? true : false,
              onPressed: () {
                widget.tabPressed(2);
              },
            ),
          ],
        ));
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData iconPath;
  final bool selected;
  final Function onPressed;

  BottomTabBtn({this.iconPath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: (20),
            vertical: (20)),
        child: Icon(
          iconPath ?? Icons.home_outlined,
          size: (30),
          color: _selected ? Color(0xFF4157FF) : Colors.black,
        ),
      ),
    );
  }
}

