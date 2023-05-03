import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_mydical/feature/auth/presentation/blocAuth/bloc/auth_bloc.dart';
import 'package:my_mydical/feature/auth/presentation/widget/FormError.dart';
import 'package:my_mydical/feature/bottomnavigationbar/homepage.dart';

import '../../../bottomnavigationbar/Loading.dart';
import '../widget/FormSucssuflyt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthintactedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color(0xFF00d3f5),
                content: Text('Succuflly login')));
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const HomePage()),
                (route) => false);
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.massage.toString())));
            Navigator.of(context).pushNamed('/login');
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return FormSucssufly();
          } else if (state is LoadingAuthState) {
            return const LoadingPage();
          } else if (state is ErrorState) {
            return FormError();
          } else {
            return FormSucssufly();
          }
        },
      ),
    );
  }
}
