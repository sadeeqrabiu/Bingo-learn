import 'package:bingolearn/core/models/login_response.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/local_store/shared_service.dart';
import '../tools/colors.dart';


class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {


  //Calling model offline
  LoginResponseModel loginResponseModel = LoginResponseModel(token: '');

  @override
  void initState() {
    super.initState();
    // checkIsUserUpdated();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    //MediaQuery
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        toolbarHeight: height * 0.02,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                    width: width * .8,
                    height: height * .13,
                    child: Lottie.asset('assets/lottie/loading.json')),
              ),
              const Column(
                children: [
                  Text('Please wait while we',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('set up your account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                ],
              ),
            ],
          )),
    );
  }

  void fetchData() async {
    var response = await SharedService.loginDetails();
    setState(() {
      loginResponseModel = LoginResponseModel.fromJson(response!.toJson());
    });
  }
}
