import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_mydical/feature/bottomnavigationbar/Loading.dart';
import 'package:my_mydical/feature/profile/domain/antites/antitesprofile.dart';
import 'package:my_mydical/feature/profile/presentation/widget/logoutbutton.dart';

import '../../../MyAppointment/presentaion/page/MyAppointmentPage.dart';
import '../../../nurses/presentation/widget/Clippathesnurses.dart';
import '../bloc/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is LoadingProfileStete) {
            return LoadingPage();
          } else if (state is SucProfileState) {
            return FormProfilePage(
              dataProfile: state.dataProfile,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class FormProfilePage extends StatelessWidget {
  DataProfile dataProfile;
  FormProfilePage({required this.dataProfile, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('asset/Group 26.png'),
        Expanded(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/PicsArt_03-29-10.15.57.png',
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      Image.asset(
                        'asset/curved-arrow.png',
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 5.5,
                          shadowColor: Color(0xFF00d3f5),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Email:Mohamad@gmail.com',
                                  style: GoogleFonts.raleway(
                                      fontSize: 15, color: Color(0xFF253F4B)),
                                ),
                              ),
                              Text(
                                'Phone:965508616',
                                style: GoogleFonts.raleway(
                                    fontSize: 13, color: Color(0xFF253F4B)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    'asset/undraw_Personal_info_re_ur1n-removebg-preview.png',
                    width: 250,
                  ),
                  Text(
                    dataProfile.name.toString().toUpperCase(),
                    style: GoogleFonts.raleway(
                        fontSize: 25, color: Color(0xFF253F4B)),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    elevation: 5.5,
                    shadowColor: Color(0xFF00d3f5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.email,
                                size: 25,
                                color: Color(0xFF253F4B),
                              ),
                            ),
                            Text(
                              'Email: ${dataProfile.email.toString()}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF253F4B)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.phone,
                                size: 25,
                                color: Color(0xFF253F4B),
                              ),
                            ),
                            Text(
                              'Phone: ${dataProfile.phone.toString()}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF253F4B)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.location_on,
                                size: 25,
                                color: Color(0xFF253F4B),
                              ),
                            ),
                            Text(
                              'Address: ${dataProfile.address.toString()}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF253F4B)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.calendar_month,
                                size: 25,
                                color: Color(0xFF253F4B),
                              ),
                            ),
                            Text(
                              'Date_Birth:${dataProfile.birthday.toString()}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF253F4B)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.male,
                                size: 25,
                                color: Color(0xFF253F4B),
                              ),
                            ),
                            Text(
                              'Gender:${dataProfile.gender.toString()}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xFF253F4B)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF00d3f5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)))),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return MyAppointmentPage();
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'My Appointment',
                                style: TextStyle(color: Color(0xFF253F4B)),
                              ),
                            )),
                      )
                    ],
                  ),
                  Logoutbtn(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileBloc, ProfileState>(
//       builder: (context, state) {
//         return Scaffold(
//           body: BlocBuilder<ProfileBloc, ProfileState>(
//             builder: (context, state) {
//               if (state is LoadingProfileStete) {
//                 return LoadingPage();
//               } else if (state is SucProfileState) {
//                 return ProfileFormPage(
//                   dataProfile: state.dataProfile,
//                 );
//               } else if (state is ErrorsProfileData) {
//                 return Center(
//                   child: Text('asdqwe'),
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class ProfileFormPage extends StatelessWidget {
//   DataProfile dataProfile;

//   ProfileFormPage({required this.dataProfile, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('asdqwe'),
//     );
//   }
// }
