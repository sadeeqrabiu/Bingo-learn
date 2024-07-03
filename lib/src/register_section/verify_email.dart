import 'package:bingolearn/src/Languages/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../tools/colors.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({
    Key? key,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  //
  var verifyEmail = false;

  @override
  void initState() {
    super.initState();
    checkTime();
  }

  checkTime() async {
    // Simulate a service call
    await Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        verifyEmail = true;
      });
    });
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
                width: width * .5,
                height: height * .3,
                child: Lottie.asset('assets/lottie/email.json')),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * .05, right: width * .05),
            child: const Column(
              children: [
                Text(
                  'We have just sent you an email.',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Text('Please take a moment to verify your account.',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Gap(height * .45),
          if (verifyEmail)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    child: Container(
                      height: height * 0.06,
                      width: width * .5,
                      margin: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorMain),
                      child: Center(
                        child: Text(
                          'Verify',
                          style: TextStyle(color: colorPrimary),
                        ),
                      ),
                    ),
                    onTap: () {

                      debugPrint('verify Email : ${widget.firstName!}${widget.middleName!}${widget.lastName!}${widget.email!}');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  SelectionScreen(
                                    firstName: widget.firstName,
                                    middleName: widget.middleName,
                                    lastName: widget.lastName,
                                    email: widget.email,
                                  )),
                          (route) => false);
                    }),
              ],
            )
        ],
      )),
    );
  }
}
