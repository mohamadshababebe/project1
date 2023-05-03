import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_mydical/feature/AddAppointment/domain/antites/antittes.dart';

import '../bloc/bloc/add_bloc.dart';

class FormErrorsAdd extends StatelessWidget {
  FormErrorsAdd({required this.time, required this.doctordata, super.key});
  String? selectename;

  String? _selectedTime;

  DateTime? _selectedDateTime;

  TextEditingController namecontroller = TextEditingController();

  TextEditingController datecontroller = TextEditingController();

  TextEditingController timecontroller = TextEditingController();

  TextEditingController birthdaycontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();

  TextEditingController doctoridcontroller = TextEditingController();
  List<DoctorDatas>? doctordata;
  List<String>? time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('asset/Group 27.png'),
        Expanded(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          shape:const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          elevation: 5.5,
                          shadowColor: Colors.red,
                          child: TextFormField(
                            controller: namecontroller,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                hintText: 'Enter Your Name'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          elevation: 5.5,
                          shape:const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          shadowColor: Colors.red,
                          child: TextFormField(
                            controller: addresscontroller,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                hintText: 'Enter Your Address'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          elevation: 5.5,
                          shape:const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          shadowColor: Colors.red,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                prefixIcon: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                hintText: 'Enter Your Birthday:'),
                            controller: birthdaycontroller,
                            onTap: () async {
                              DateTime? pickdatetime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());

                              if (pickdatetime != null) {
                                birthdaycontroller.text =
                                    DateFormat('y-MM-d').format(pickdatetime);
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          elevation: 5.5,
                          shape:const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          shadowColor: Colors.red,
                          child: TextFormField(
                            controller: phonecontroller,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                hintText: 'Enter Your PhoneNumber'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'asset/undraw_sign__up_nm4k-removebg-preview.png',
                    width: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      shadowColor: Colors.red,
                      shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      elevation: 5.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: Colors.red,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText: 'Appointment_Date:'),
                              controller: datecontroller,
                              onTap: () async {
                                DateTime? pickdatetime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100));

                                if (pickdatetime != null) {
                                  datecontroller.text =
                                      DateFormat('y-MM-d').format(pickdatetime);
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    prefixIcon: Icon(
                                      Icons.monitor_heart_outlined,
                                      color: Colors.red,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText: 'Doctor Name:'),
                                value: selectename,
                                items: doctordata!
                                    .map((e) => DropdownMenuItem<int>(
                                        value: e.id,
                                        child: Text(e.name.toString())))
                                    .toList(),
                                onChanged: (value) {
                                  selectename = value.toString();
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButtonFormField<String>(
                              style:const TextStyle(color: Color(0xFF253F4B)),
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      )),
                                  prefixIcon: Icon(
                                    Icons.timer,
                                    color: Colors.red,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText: 'Time:'),
                              value: _selectedTime,
                              onChanged: (String? newValue) {
                                _selectedTime = newValue!;
                              },
                              items: time!.map<DropdownMenuItem<String>>(
                                  (String values) {
                                return DropdownMenuItem<String>(
                                  value: values,
                                  child: Text(values),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary:const Color(0xFF00d3f5),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)))),
                      onPressed: () {
                        AddDoctorData addData = AddDoctorData(
                            birthday: birthdaycontroller.text,
                            doctor_id: selectename,
                            address: addresscontroller.text,
                            date: datecontroller.text,
                            name: namecontroller.text,
                            phone: phonecontroller.text,
                            time: _selectedTime);
                        BlocProvider.of<AddBloc>(context)
                            .add(AddAppointmetnEvent(addDoctorData: addData));
                      },
                      child:const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(
                          'AddAppointment',
                          style: TextStyle(color: Color(0xFF253F4B)),
                        ),
                      )),
                  Text(
                    'Your Welcome',
                    style: GoogleFonts.raleway(
                        fontSize: 10, color: Color(0xFF253F4B)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'asset/undraw_Agree_re_hor9-removebg-preview (1).png',
                    width: 100,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
