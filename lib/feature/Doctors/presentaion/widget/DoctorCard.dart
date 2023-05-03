import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_mydical/feature/Doctors/presentaion/widget/ClipPath.dart';
import 'package:my_mydical/feature/Doctors/presentaion/widget/SearchDOCTOR.dart';

import '../../domain/antites/DoctorData.dart';

class DoctorCard extends StatefulWidget {
  List<DoctorData> doctordata;
  DoctorCard({required this.doctordata, super.key});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  List<DoctorData>? searchdoctor;

  TextEditingController searchcontroller = TextEditingController();

  void addSerchedforitemtosearchlist(String searchcharacter) {
    searchdoctor = widget.doctordata
        .where((element) =>
            element.clinic.name.toLowerCase().startsWith(searchcharacter))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('asset/Group 25.png'),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5.5,
          shadowColor: Color(0xFF00d3f5),
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 60,
              child: TextFormField(
                onChanged: (searchcharacter) {
                  addSerchedforitemtosearchlist(searchcharacter);
                },
                controller: searchcontroller,
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
                    hintText: 'Find Your Clinic'),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 800,
            child: ListView.builder(
                itemCount: searchcontroller.text.isEmpty
                    ? widget.doctordata.length
                    : searchdoctor?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 5.5,
                      shadowColor: Color(0xFF00d3f5),
                      child: ExpansionTile(
                        title: Text(
                          searchcontroller.text.isEmpty
                              ? widget.doctordata[index].detail.specialization
                              : searchdoctor![index].detail.specialization,
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFF00d3f5)),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: []),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      searchcontroller.text.isEmpty
                                          ? widget.doctordata[index].name
                                          : searchdoctor![index].name,
                                      style:
                                          TextStyle(color: Color(0xFF446879)),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 16.0),
                                          child: Text(
                                            'Phone:  ${searchcontroller.text.isEmpty ? widget.doctordata[index].detail.phone : searchdoctor![index].detail.phone}',
                                            style: TextStyle(
                                                color: Color(0xFF446879)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            searchcontroller.text.isEmpty
                                                ? widget.doctordata[index]
                                                    .detail.email
                                                : searchdoctor![index]
                                                    .detail
                                                    .email,
                                            style: TextStyle(
                                                color: Color(0xFF446879)),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                        leading: Text(
                          searchcontroller.text.isEmpty
                              ? widget.doctordata[index].clinic.name
                              : searchdoctor![index].clinic.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF446879),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Image.asset(
          'asset/undraw_doctor_kw5l-removebg-preview.png',
          width: 250,
        )
      ],
    );
  }
}
