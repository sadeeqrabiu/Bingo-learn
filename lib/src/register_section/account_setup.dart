import 'package:bingolearn/core/api_section/api_service.dart';
import 'package:bingolearn/core/models/login/login_response.dart';
import 'package:bingolearn/core/models/sign_up/sign_up_response.dart';
import 'package:bingolearn/core/models/sign_up/sign_up_user.dart';
import 'package:bingolearn/src/login_section/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/local_store/shared_service.dart';
import '../../core/models/sign_up/sign_up_resquest.dart';
import '../tools/colors.dart';


class AccountSetup extends StatefulWidget {
  const AccountSetup({
    Key ? key,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.language,
    required this.lLanguage,
    required this.learningGoal,
    required this.learningFlag

  }) : super (key: key);

  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;
  final String? language;
  final String? lLanguage;
  final String? learningGoal;
  final String? learningFlag;

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {




  @override
  void initState() {
    super.initState();
    // checkIsUserUpdated();
    fetchData();
  }

  SignUpResponseModel signUpResponseModel = SignUpResponseModel(id: '');
  var language = 'English';


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
    var response = await SharedService.getSignUpID();
    setState(() {
      signUpResponseModel = SignUpResponseModel.fromJson(response!.toJson());
    });

    debugPrint(signUpResponseModel.id);
    signUpUserData();
  }


//
  signUpUserData() {
    SignUpUserModel model = SignUpUserModel(
      firstName: widget.firstName!,
      lastName: widget.lastName!,
      middleName: widget.middleName!,
      email: widget.email!,
      language: language,
      lLanguage: widget.lLanguage!,
      learningFlag: widget.learningFlag!,
      userId: signUpResponseModel.id,
      learningGoal: widget.learningGoal!,

    );
    ApiService.signUpData(model).then((response) => {
      if (response)
        {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen()),
                  (route) => false),
        }
    });
  }
}
