import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_mydical/feature/bottomnavigationbar/Loading.dart';
import 'package:my_mydical/feature/nurses/domain/antites/antitesnurs.dart';

import '../bloc/bloc/nurses_bloc.dart';
import '../widget/FormNurses.dart';

class NursesPage extends StatelessWidget {
  const NursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NursesBloc, NursesState>(
        builder: (context, state) {
          if (state is LoadingNursesState) {
            return LoadingPage();
          } else if (state is LoadedNursesState) {
            return LiquidPullToRefresh(
              color: Color(0xFF00d3f5),
              height: 200,
              backgroundColor: Colors.white,
              animSpeedFactor: 2,
              showChildOpacityTransition: true,
              onRefresh: () => _onrefresH(context),
              child: FormNurses(
                nursData: state.nursesData,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<void> _onrefresH(BuildContext context) async {
    BlocProvider.of<NursesBloc>(context).add(GetAllNursesEvent());
  }
}
