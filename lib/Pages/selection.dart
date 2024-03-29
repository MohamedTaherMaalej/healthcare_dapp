import 'package:flutter/material.dart';
import 'package:healthcare_dapp/Services/contracts.dart';
import 'package:healthcare_dapp/Utils/routes.dart';
import 'package:healthcare_dapp/utils.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;
class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {

  @override
  Widget build(BuildContext context) {
    var contracts = Provider.of<Contracts>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 160, 16, 0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Color(0xffffffff)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 64),
                    width: 125,
                    height: 150,
                    child: Image.asset(
                      'assets/icons/logo_mydoc.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Stack(
                    children: [
                      // Background image or color
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                              bool doctorExist = await contracts.existDoctor();
                              dev.log(doctorExist.toString());
                              if(doctorExist){
                                Navigator.pushReplacementNamed(
                                context,
                                MyRoutes.doctorHomePage);
                              }else{
                                Navigator.pushReplacementNamed(
                                context,
                                MyRoutes.doctorSignupPage);
                              }
                            // Navigate to next screen when button is pressed
                             // configure next page here !!
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff05c0ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: Size(365, 56),
                          ),
                          child: Text(
                            'DOCTOR',
                            style: safeGoogleFont(
                              'Cuprum',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      // Background image or color
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                              bool patientExist = await contracts.existPatient();
                              dev.log(patientExist.toString());
                              if(patientExist){
                                Navigator.pushReplacementNamed(
                                context,
                                MyRoutes.patientHomePage);
                              }else{
                                Navigator.pushReplacementNamed(
                                context,
                                MyRoutes.patientSignupPage);
                              }
                            // Navigate to next screen when button is pressed
                             // configure next page here !!
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffcef3ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: Size(365, 56),
                          ),
                          child: Text(
                            'PATIENT',
                            style: safeGoogleFont(
                              'Cuprum',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: Color(0xff05c0ff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
