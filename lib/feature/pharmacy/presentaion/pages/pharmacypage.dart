import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_mydical/feature/Doctors/presentaion/widget/SearchDOCTOR.dart';
import 'package:my_mydical/feature/pharmacy/domain/antites/antites.dart';

import '../../../bottomnavigationbar/Loading.dart';
import '../bloc/bloc/pharmacy_bloc.dart';
import '../widget/PharmacyCard.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PharmacyBloc, PharmacyState>(
        builder: (context, state) {
          if (state is LoadingPharmacy) {
            return LoadingPage();
          } else if (state is GetallPharmacyState) {
            return LiquidPullToRefresh(
              color: Color(0xFF00d3f5),
              height: 200,
              backgroundColor: Colors.white,
              animSpeedFactor: 2,
              showChildOpacityTransition: true,
              onRefresh: () => _onrefresh(context),
              child: FormPharmacy(
                datapharmacy: state.dataPharmacy,
              ),
            );
          } else if (state is ErrorPharmacyState) {
            return Center(
              child: Text(state.massage),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<void> _onrefresh(BuildContext context) async {
    BlocProvider.of<PharmacyBloc>(context).add(GetallPharmecyEvent());
  }
}
