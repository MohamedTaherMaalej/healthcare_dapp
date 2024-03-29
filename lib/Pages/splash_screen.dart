import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:healthcare_dapp/Pages/view_prescription.dart';
// import 'package:healthcare_dapp/Utils/connector.dart';
import 'package:healthcare_dapp/Utils/routes.dart';
// import 'package:web3dart/credentials.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({Key? key}) : super(key: key);

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  TextEditingController doctorAddress = TextEditingController();
  bool showLoading = true;
  List<List<String>> prescriptions = [];

  _showPickerAuthorization() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Authorize Doctor",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    // padding: const EdgeInsets.all(8.0),
                    child: CupertinoFormSection(
                        backgroundColor: Colors.transparent,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffe0e0e0)),
                          color: Color(0xffffffff),
                          //borderRadius: BorderRadius.circular(12),
                        ),
                        children: [
                          CupertinoFormRow(
                            //padding: EdgeInsets.only(left: 0),
                            child: CupertinoTextFormFieldRow(
                              style: GoogleFonts.poppins(),
                              controller: doctorAddress,
                              // obscureText: true,
                              placeholder: "Enter Doctor's Address",
                              // prefix: "Email".text.make(),
                              padding: const EdgeInsets.only(left: 0),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Address can't be empty";
                                }
                                return null;
                              },
                              prefix: Text(
                                'Address  | ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ]),
                  ),
                  InkWell(
                      onTap: () async {
                        // setAuthorization();
                        Navigator.pop(context);
                        doctorAddress.clear();
                      },
                      child: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )))
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // getPrescriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => _showPickerAuthorization(),
        child: Container(
          width: (MediaQuery.of(context).size.width / 1.5),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  FontAwesomeIcons.userDoctor,
                  color: Colors.white,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Text(
                  'Authorize Doctor',
                  style: TextStyle(
                      // fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      CupertinoIcons.person_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      // thickness: 5,
                    ),
                    Center(
                      child: Text(
                        'Patient Panel',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: Colors.green.shade50,
                        color: Color(0xff98ff98),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                          // child: Text(
                          //   Connector.address.toString(),
                          //   style: TextStyle(
                          //       fontSize:
                          //           (MediaQuery.of(context).size.width * 0.02),
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.green),
                          // ),
                          ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        // Connector.key = "";
                        Navigator.popAndPushNamed(context, MyRoutes.patientLoginPage);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          // color: Colors.red.shade50,
                          color: Color(0xffff5c5c),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                fontSize:
                                    (MediaQuery.of(context).size.width * 0.03),
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.timeline,
                        color: Colors.black,
                        size: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        'Medical History',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              (showLoading == false && prescriptions.isNotEmpty)
                  ? ListView.builder(
                      itemCount: prescriptions.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          // onTap: () async {
                          //   await Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => ViewPrescription(
                          //               index: index + 1,
                          //               record: prescriptions[index])));
                          // },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Container(
                                // margin: EdgeInsets.all(16),
                                // height: 100,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          color: Colors.black,
                                          child: Text(
                                            "  ${index + 1}  ",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const VerticalDivider(
                                      thickness: 2,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.clock,
                                              size: 15,
                                              // color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              prescriptions[index][0],
                                              // style:
                                              //     Theme.of(context).textTheme.caption,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.userDoctor,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  150,
                                              // height: 30,
                                              child: Text(
                                                prescriptions[index][1],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    )
                  : showLoading == true
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: CupertinoActivityIndicator(
                              radius: 20,
                            ),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 32.0, left: 16),
                          child: Text(
                            "No Medical History!",
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
