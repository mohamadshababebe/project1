import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/antites/antites.dart';
import '../blocAuth/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class FormSucssufly extends StatelessWidget {
  FormSucssufly({super.key});

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
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
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              child: Card(
                elevation: 5.5,
                shadowColor: const Color(0xFF00d3f5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this falied is not empty';
                    }
                    return null;
                  },
                  cursorColor: const Color(0xFF00d3f5),
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF00d3f5),
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
                shadowColor: const Color(0xFF00d3f5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextFormField(
                  cursorColor: const Color(0xFF00d3f5),
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
                        color: Color(0xFF00d3f5),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Password:'),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF253F4B),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  onPressed: () {
                    LoginData loginData = LoginData(
                        email: emailcontroller.text,
                        password: passwordcontroller.text);
                    BlocProvider.of<AuthBloc>(context)
                        .add(Authincated(loginData: loginData));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ),
          ],
        ));
  }
}
