import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({Key? key, required  this.name, required this.icon, required this.onPressed}) : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(icon, size: 25, color: Colors.black),
            const SizedBox(width: 20,),
            Text(name, style: TextStyle(fontSize: 20, color: Colors.black), )
          ],
        )
      )
    );
  }
}
