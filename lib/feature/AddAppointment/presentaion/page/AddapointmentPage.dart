import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_mydical/feature/bottomnavigationbar/Loading.dart';

import '../bloc/bloc/add_bloc.dart';
import '../widget/FormAdd.dart';
import '../widget/FormErrorsAdd.dart';

class AddAppointmentPage extends StatefulWidget {
  const AddAppointmentPage({super.key});

  @override
  State<AddAppointmentPage> createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  bool _addapointmentstate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AddBloc, AddState>(
      listener: (context, state) {
        if (state is AddApointmentState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Succsyfly Add')));
          setState(() {
            _addapointmentstate = true;
          });
        } else if (state is ErrorsAddAppointmentState) {
          showDialog(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.massage),
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        if (state is LoadingAddState) {
          return const LoadingPage();
        } else if (state is GetDoctorState) {
          return FormAdd(time: state.times, doctordata: state.doctordatas);
        } else if (state is AddApointmentState) {
          return FormAdd(
            time: state.time,
            doctordata: state.doctordatas,
          );
        } else if (state is ErrorsAddAppointmentState) {
          return FormErrorsAdd(
              time: state.times!, doctordata: state.doctordatas!);
        } else {
          FormAdd();
          return const Center(
            child: Text('Succsuflly Add Please Refresh This Page'),
          );
        }
      },
    ));
  }
}
