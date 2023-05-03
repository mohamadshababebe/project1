import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/presentation/pages/loginpage.dart';
import '../splashscreenbloc/bloc/splash_screen_bloc.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 17, 39, 49),
        child: BlocListener<SplashScreenBloc, SplashScreenState>(
            listener: (context, state) {
              if (state is SplasScreenLoaded) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginPage();
                }));
              }
            },
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 170.0),
                      child: Image.asset(
                        'asset/2.png',
                        width: MediaQuery.of(context).size.width / 1.2,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Get EveryThing Planned!',
                        style: GoogleFonts.raleway(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Our Application Provides Distinguished Services That Make It Easier For You To Be Able To Book An Appointment And Not Waste Time With The Best Medical Staff.',
                    style: TextStyle(color: Colors.white,),
                  ),
                ),
                const Spacer(),
              ],
            )),
      ),
    );
  }
}
