import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/presentaion/bloc/bloc/destroy_bloc.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/presentaion/page/DestroyPage.dart';

import '../../domain/antites/antites.dart';
import '../blocupdate/bloc/update_bloc.dart';
import '../page/updateappointmetnpage.dart';

class FormMyAppointmentPage extends StatefulWidget {
  List<MyAppointmentModel> myappointmentmodel;
  List<DoctorDatas> doctordata;
  List<String> times;
  FormMyAppointmentPage(
      {required this.times,
      required this.doctordata,
      required this.myappointmentmodel,
      super.key});

  @override
  State<FormMyAppointmentPage> createState() => _FormMyAppointmentPageState();
}

class _FormMyAppointmentPageState extends State<FormMyAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('asset/Group 18.png'),
        ElevatedButton.icon(
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<DestroysBloc>(context).add(MyDestroyEvent());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const DestroyPage();
              }));
            },
            label: const Text('MyAppointment Delete')),
        Expanded(
            child: ListView.separated(
          itemCount: widget.myappointmentmodel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 5,
                shadowColor: const Color(0xFF00d3f5),
                child: GestureDetector(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Name: ${widget.myappointmentmodel[index].name}',
                                    style: GoogleFonts.raleway(
                                        fontSize: 18,
                                        color: const Color(0xff253F4B)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'birthday: ${widget.myappointmentmodel[index].birthday}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Address: ${widget.myappointmentmodel[index].address}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'DoctorName: ${widget.myappointmentmodel[index].doctor_id}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Date: ${widget.myappointmentmodel[index].date}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Stuts: ${widget.myappointmentmodel[index].status}',
                                    style: GoogleFonts.raleway(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Time: ${widget.myappointmentmodel[index].time}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Dignosies: ${widget.myappointmentmodel[index].diagnosis}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                              ],
                            ),
                            Image.asset(
                              'asset/undraw_fall_thyk.png',
                              width: 200,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<UpdateBloc>(context).add(SucUpdateEvent(
                        myAppointmentModel: widget.myappointmentmodel[index]));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => UpdateMyAppointmentPage(
                              dotctrdatas: widget.doctordata,
                              time: widget.times)),
                    );
                  },
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsets.all(8));
          },
        )),
      ],
    );
  }
}
