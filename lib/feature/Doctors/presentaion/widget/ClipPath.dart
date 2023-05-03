import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bottomnavigationbar/MyCustom.dart';

class ClipPathDoctor extends StatelessWidget {
  const ClipPathDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        color: Color(0xFF446879),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Doctors',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      clipper: MyCustom(),
    );
  }
}
