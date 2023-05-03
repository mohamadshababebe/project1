import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_mydical/feature/Doctors/presentaion/widget/ClipPath.dart';
import 'package:my_mydical/feature/nurses/presentation/widget/Clippathesnurses.dart';

import '../../domain/antites/antitesnurs.dart';

class FormNurses extends StatefulWidget {
  List<NureseData> nursData;
  FormNurses({required this.nursData, super.key});

  @override
  State<FormNurses> createState() => _FormNursesState();
}

class _FormNursesState extends State<FormNurses> {
  List<NureseData>? searchnurses;
  TextEditingController SearchNursesController = TextEditingController();
  void addSerchedforitemtosearchlist(String searchNurses) {
    searchnurses = widget.nursData
        .where((element) => element.name.toLowerCase().startsWith(searchNurses))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('asset/789.png'),
        Card(
          elevation: 5.5,
          shadowColor: Color(0xFF00d3f5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 60,
              child: TextFormField(
                onChanged: (searchcharacter) {
                  addSerchedforitemtosearchlist(searchcharacter);
                },
                controller: SearchNursesController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        )),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF00d3f5),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Find Your Nurse'),
              )),
        ),
        Image.asset(
          'asset/undraw_medical_care_movn-removebg-preview.png',
          width: MediaQuery.of(context).size.width / 1.5,
        ),
        Expanded(
          child: SizedBox(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5.5,
                      shadowColor: Color(0xFF00d3f5),
                      child: ListTile(
                        title: Text(
                          SearchNursesController.text.isEmpty
                              ? widget.nursData[index].name
                                  .toString()
                                  .toUpperCase()
                              : searchnurses![index].name.toString(),
                          style: GoogleFonts.raleway(
                            color: Color(0xFF253F4B),
                            fontSize: 20,
                          ),
                        ),
                        trailing: Text(
                          SearchNursesController.text.isEmpty
                              ? widget.nursData[index].phone.toString()
                              : searchnurses![index].phone.toString(),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            SearchNursesController.text.isEmpty
                                ? widget.nursData[index].description
                                : searchnurses![index].description,
                            style: TextStyle(
                              color: Color.fromARGB(255, 102, 129, 141),
                            ),
                          ),
                        ),
                      ));
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1),
                  );
                },
                itemCount: SearchNursesController.text.isEmpty
                    ? widget.nursData.length
                    : searchnurses!.length),
          ),
        ),
      ],
    );
  }
}
