import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_mydical/feature/Doctors/domain/antites/DoctorData.dart';

import '../../../bottomnavigationbar/Loading.dart';
import '../bloc/bloc/doctor_bloc.dart';
import '../widget/DoctorCard.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormDoctor(),
    );
  }
}

class FormDoctor extends StatelessWidget {
  const FormDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        if (state is LoadingDoctorState) {
          return LoadingPage();
        } else if (state is GetAllDoctorState) {
          return LiquidPullToRefresh(
            color: Color(0xFF00d3f5),
            height: 200,
            backgroundColor: Colors.white,
            animSpeedFactor: 2,
            showChildOpacityTransition: true,
            onRefresh: () => _onRefresh(context),
            child: DoctorCard(
              doctordata: state.doctordata,
            ),
          );
        } else if (state is ErrorDoctorState) {
          return Center(
            child: Text('We Dont Have Any Doctor Now'),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<DoctorBloc>(context).add(RefreshAllEvent());
  }
}
