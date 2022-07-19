import 'package:flutter/material.dart';

class AppBarCustomized extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomized({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Feed.me!',
          style: TextStyle(
              fontFamily: 'TitanOne', color: Colors.black, fontSize: 30)),
      toolbarHeight: 75,
      centerTitle: true,
      backgroundColor: Color.fromRGBO(252, 213, 167, 1),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(
      appBar.preferredSize.height); //throw UnimplementedError();
}
