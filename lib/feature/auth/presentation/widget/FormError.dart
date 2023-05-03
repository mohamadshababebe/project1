import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/antites/antites.dart';
import '../blocAuth/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class FormError extends StatelessWidget {
  FormError({super.key});
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/PicsArt_03-29-10.15.57.png',
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const Text(
                  'Enter Your Email And Password',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            child: Card(
              elevation: 5.5,
              shadowColor: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'this falied is not empty';
                  }
                  return null;
                },
                cursorColor: Colors.red,
                controller: emailcontroller,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        )),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Email:'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(12)),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            child: Card(
              elevation: 5.5,
              shadowColor: Colors.red,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextFormField(
                cursorColor: Colors.red,
                controller: passwordcontroller,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        )),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Password:'),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF253F4B),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () {
                  LoginData loginData = LoginData(
                      email: emailcontroller.text,
                      password: passwordcontroller.text);
                  BlocProvider.of<AuthBloc>(context)
                      .add(Authincated(loginData: loginData));
                },
                child: const Text(
                  'login',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      )),
    );
  }
}
