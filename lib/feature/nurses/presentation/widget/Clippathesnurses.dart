import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bottomnavigationbar/MyCustom.dart';


class ClipPathNurses extends StatelessWidget {
  const ClipPathNurses({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        color: Color(0xFF6200EE),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Nurses',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      clipper: MyCustom(),
    );
  }
}
