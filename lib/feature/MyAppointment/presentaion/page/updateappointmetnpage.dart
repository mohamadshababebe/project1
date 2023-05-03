import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_mydical/feature/MyAppointment/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointment/presentaion/page/MyAppointmentPage.dart';
import 'package:my_mydical/feature/bottomnavigationbar/Loading.dart';

import '../blocdelete/bloc/delete_bloc.dart';
import '../blocupdate/bloc/update_bloc.dart';

class UpdateMyAppointmentPage extends StatelessWidget {
  final List<DoctorDatas> dotctrdatas;
  final List<String> time;
  int? selectename;
  String? _selectedTime;
  MyAppointmentModel? myAppointmentModel;
  UpdateMyAppointmentPage(
      {required this.dotctrdatas,
      required this.time,
      this.myAppointmentModel,
      super.key});

  TextEditingController namecontroller = TextEditingController();

  TextEditingController datecontroller = TextEditingController();

  TextEditingController timecontroller = TextEditingController();

  TextEditingController birthdaycontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();

  TextEditingController doctoridcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UpdateBloc, UpdateState>(
        listener: (context, state) {
          if (state is SucUpdateState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('SucSuffly')));
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const MyAppointmentPage();
            }));
          } else if (state is ErrorsUpdate) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.massage)));
          }
        },
        builder: (context, state) {
          if (state is LoadingUpdate) {
            return const LoadingPage();
          } else if (state is BlaBlaState) {
            myAppointmentModel = state.myAppointmentModel;
            MyAppointmentModel model = state.myAppointmentModel;

            namecontroller.text = model.name!;
            phonecontroller.text = model.phone.toString();
            datecontroller.text = model.date.toString();
            timecontroller.text = model.time.toString();
            doctoridcontroller.text = model.doctor_id.toString();
            birthdaycontroller.text = model.birthday.toString();
            addresscontroller.text = model.address.toString();

            return Scaffold(
              body: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: namecontroller,
                    ),
                    TextFormField(
                      controller: datecontroller,
                    ),
                    TextFormField(
                      controller: birthdaycontroller,
                    ),
                    TextFormField(
                      controller: phonecontroller,
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedTime,
                      onChanged: (String? newValue) {
                        _selectedTime = newValue!;
                      },
                      items:
                          time.map<DropdownMenuItem<String>>((String values) {
                        return DropdownMenuItem<String>(
                          value: values,
                          child: Text(values),
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      controller: addresscontroller,
                    ),
                    DropdownButtonFormField(
                        value: selectename,
                        items: dotctrdatas
                            .map((e) => DropdownMenuItem<int>(
                                value: e.id, child: Text(e.name.toString())))
                            .toList(),
                        onChanged: (value) {
                          selectename = value;
                        }),
                    ElevatedButton(
                        onPressed: () {
                          MyAppointmentModel myAppointmentModels =
                              MyAppointmentModel(
                            id: model.id,
                            phone: phonecontroller.text,
                            birthday: birthdaycontroller.text,
                            doctor_id: selectename,
                            address: addresscontroller.text,
                            date: datecontroller.text,
                            name: namecontroller.text,
                            time: _selectedTime,
                          );

                          BlocProvider.of<UpdateBloc>(context).add(
                              RemtotewithDataEvent(
                                  myAppointmentModel: myAppointmentModels));
                        },
                        child: const Text('Update')),
                    ElevatedButton(
                        onPressed: () {
                          return DeleteDialog(context);
                        },
                        child: const Text('Delete')),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void DeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<DeleteBloc, DeleteState>(
            listener: (context, state) {
              if (state is SucDeleteState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Sucssyffly')));
                Navigator.pop(context);
                Navigator.pop(context);
              } else if (state is ErrorsDeleteState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.massage)));
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is LoadingDeleteState) {
                return const AlertDialog(
                  title: LoadingPage(),
                );
              }
              return DeleteDialogPage(id: myAppointmentModel!.id!);
            },
          );
        });
  }
}

class DeleteDialogPage extends StatelessWidget {
  int id;

  DeleteDialogPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.5,
      shadowColor: const Color(0xFF00d3f5),
      title: Column(
        children: [
          Text(
            'Are You Sure To Delete The',
            style: GoogleFonts.raleway(),
          ),
          Text(
            'Appointment?',
            style: GoogleFonts.raleway(),
          ),
          Image.asset('asset/undraw_Throw_away_re_x60k.png')
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF446879),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No',
                    style: GoogleFonts.raleway(),
                  ),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF446879),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)))),
                onPressed: () {
                  BlocProvider.of<DeleteBloc>(context)
                      .add(SucDeleteEvent(id: id));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Yes',
                    style: GoogleFonts.raleway(),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
