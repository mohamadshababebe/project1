import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_mydical/feature/MyAppointment/presentaion/bloc/bloc/my_appointment_bloc.dart';
import 'package:my_mydical/feature/MyAppointment/presentaion/blocupdate/bloc/update_bloc.dart';
import 'package:my_mydical/feature/MyAppointment/presentaion/page/updateappointmetnpage.dart';
import 'package:my_mydical/feature/bottomnavigationbar/Loading.dart';

import '../../domain/antites/antites.dart';
import '../widget/myAppointment.dart';

class MyAppointmentPage extends StatelessWidget {
  const MyAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyAppointmentBloc, MyAppointmentState>(
        builder: (context, state) {
          if (state is LoadingMyAppointmentState) {
            return LoadingPage();
          } else if (state is MyAppointmentSucState) {
            return LiquidPullToRefresh(
                color: Color(0xFF00d3f5),
                height: 200,
                backgroundColor: Colors.white,
                animSpeedFactor: 2,
                showChildOpacityTransition: true,
                onRefresh: () => _onrefresH(context),
                child: FormMyAppointmentPage(
                    times: state.doctortime,
                    doctordata: state.doctordata,
                    myappointmentmodel: state.myappointmentmodel));
          } else if (state is ErrorsMyAppointmentState) {
            return Center(
              child: Text(state.massage),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<void> _onrefresH(BuildContext context) async {
    BlocProvider.of<MyAppointmentBloc>(context).add(MyAppointmentEventSuc());
  }
}

