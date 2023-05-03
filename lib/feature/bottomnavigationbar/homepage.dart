import 'package:flutter/material.dart';

import '../AddAppointment/presentaion/page/AddapointmentPage.dart';
import '../Doctors/presentaion/pages/Doctorpage.dart';
import '../nurses/presentation/pages/NursesPage.dart';
import '../pharmacy/presentaion/pages/pharmacypage.dart';
import '../profile/presentation/page/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  List<Widget> widgetpage = [
    const DoctorPage(),
    const NursesPage(),
    const AddAppointmentPage(),
    const PharmacyPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF00d3f5),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: selectedindex,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart), label: 'Doctors'),
            BottomNavigationBarItem(
                icon: Icon(Icons.vaccines), label: 'Nurses'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bloodtype), label: 'Pharmacy'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Porfile'),
          ]),
      body: widgetpage[selectedindex],
    );
  }
}
