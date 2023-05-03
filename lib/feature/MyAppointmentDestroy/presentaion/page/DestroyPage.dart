import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/domain/antites/antites.dart';
import 'package:my_mydical/feature/bottomnavigationbar/Loading.dart';

import '../bloc/bloc/destroy_bloc.dart';

class DestroyPage extends StatelessWidget {
  const DestroyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DestroysBloc, DestroysState>(
        builder: (context, state) {
          if (state is LoadingStateDestroy) {
            return LoadingPage();
          } else if (state is SucDestroysState) {
            return FormDestroy(
              myappointmentDestroy: state.myAppointmentdestroy,
            );
          } else if (state is ErrorsDestroyState) {
            return Text(state.massage);
          } else {
            throw Exception();
          }
        },
      ),
    );
  }
}

class FormDestroy extends StatelessWidget {
  List<MyAppointmentDestroy> myappointmentDestroy;
  FormDestroy({required this.myappointmentDestroy, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(myappointmentDestroy[index].name.toString());
      },
      itemCount: myappointmentDestroy.length,
    );
  }
}
