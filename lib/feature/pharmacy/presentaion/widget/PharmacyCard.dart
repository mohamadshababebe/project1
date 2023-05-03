import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bottomnavigationbar/MyCustom.dart';

import '../../domain/antites/antites.dart';

class FormPharmacy extends StatefulWidget {
  List<DataPharmcay> datapharmacy;
  FormPharmacy({required this.datapharmacy, super.key});

  @override
  State<FormPharmacy> createState() => _FormPharmacyState();
}

class _FormPharmacyState extends State<FormPharmacy> {
  List<DataPharmcay>? searchpharmacy;
  TextEditingController searcpharmacycontroller = TextEditingController();
  void addSerchedforitemtosearchlist(String SearchPharmacy) {
    searchpharmacy = widget.datapharmacy
        .where(
            (element) => element.name.toLowerCase().startsWith(SearchPharmacy))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('asset/Group 29.png'),
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
                controller: searcpharmacycontroller,
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
                    hintText: 'Find Your Midicine'),
              )),
        ),
        Expanded(
          child: SizedBox(
            height: 660,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: searcpharmacycontroller.text.isEmpty
                    ? widget.datapharmacy.length
                    : searchpharmacy!.length,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 5.5,
                      shadowColor: Color(0xFF00d3f5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  searcpharmacycontroller.text.isEmpty
                                      ? widget.datapharmacy[index].name
                                      : searchpharmacy![index].name,
                                  style: GoogleFonts.raleway(
                                      color: Color(0xFF253F4B), fontSize: 20),
                                ),
                              ),
                              Icon(
                                Icons.water_drop_outlined,
                                size: 30,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: SizedBox(
                                    width: 180,
                                    child: Text(
                                      searcpharmacycontroller.text.isEmpty
                                          ? widget
                                              .datapharmacy[index].description
                                          : searchpharmacy![index].description,
                                      style: TextStyle(),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Price:   ${searcpharmacycontroller.text.isEmpty ? widget.datapharmacy[index].prise : searchpharmacy![index].prise}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
