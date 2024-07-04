import 'dart:convert';

import 'package:bingolearn/core/models/user/usesr_data.dart';
import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/api_section/api_service.dart';
import '../../core/local_store/shared_service.dart';
import '../../core/models/login/login_response.dart';
import '../tools/colors.dart';



class LoginAcSetup extends StatefulWidget {
  const LoginAcSetup({super.key});

  @override
  State<LoginAcSetup> createState() => _LoginAcSetupState();
}

class _LoginAcSetupState extends State<LoginAcSetup> {

  //Calling model offline
  LoginResponseModel loginResponseModel = LoginResponseModel();

  //list from the APi


  @override
  void initState() {
    super.initState();
    // checkTime();
    // fetchData();
    getUser();
  }
  List<UserDataListModel>? _userData;
  // UserDataModel userDataModel = UserDataModel();

  checkTime() async {
    // Simulate a service call
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          _createRoute(),
              (route) => false);
    });
  }

  UserDataModel? userDataModel;

  Future<void> getUserData() async {
    var response = await SharedService.getSignUpID();
    setState(() {
      List<dynamic> dataList = json.decode(response.toString());
      if (dataList.isNotEmpty) {
        userDataModel = UserDataModel.fromJson(dataList[0]);
      }
    });
    debugPrint(userDataModel!.firstName);
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
  //route
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.elasticOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  void fetchData() async {

    ApiService.getUserDataList().then((response) => {

      // if (response)
      //   {
      //
      //     // debugPrint(userDataModel.middleName),
      //     // Navigator.pushAndRemoveUntil(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //         builder: (context) => const LoginAcSetup()),
      //     //         (route) => false),
      //
      //   },
      getUser(),



  });
  }
  Future<void> getUser() async {
    _userData = await ApiService.getUserDataList();
    debugPrint('firstName: ${_userData?[0].firstName}');
    debugPrint('middleName: ${_userData?[0].middleName}');
    debugPrint('LastName: ${_userData?[0].lastName}');
    debugPrint('LastName: ${_userData?[0].language}');
    // setState(() {
    //   _isloading = false;
    // });
  }

  // void getUserData() async {
  //   var response = await SharedService.getUserData();
  //   setState(() {
  //     userDataModel = UserDataModel.fromJson(response!.toJson());
  //     // userDataModel = UserDataModel.fromJson(json.decode(response.toString())[0]);
  //   });
  //   debugPrint(userDataModel.firstName);
  //
  // }
  //  Future<void> getUserData() async {
  //   var response = await SharedService.getUserData();
  //   if (response != null) {
  //     final parsedData = List<UserDataModel>.from(json.decode(response.toString()).map((item) => UserDataModel.fromJson(item)));
  //     setState(() {
  //       userDataModel = parsedData;
  //     });
  //   }
  // }

}
