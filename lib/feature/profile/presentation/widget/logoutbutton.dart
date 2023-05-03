import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/presentation/pages/loginpage.dart';
import '../../../bottomnavigationbar/MyCustom.dart';

class Logoutbtn extends StatelessWidget {
  const Logoutbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF253F4B),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          onPressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            await sharedPreferences.clear();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Logout',
              style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
            ),
          )),
    );
    ;
  }
}

class ClipPathProfile extends StatelessWidget {
  const ClipPathProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        color: Color(0xFF6200EE),
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      clipper: MyCustom(),
    );
  }
}
