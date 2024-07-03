import 'dart:async';

import 'package:bingolearn/src/register_section/reg_user.dart';
import 'package:bingolearn/src/tools/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';



class RegOtp extends StatefulWidget {
  const RegOtp({super.key});

  @override
  State<RegOtp> createState() => _RegOtpState();
}

class _RegOtpState extends State<RegOtp> {
  var endpoint = "?otp=";
  var _otpCode = "";
  var countryCode = '+234';
  final int _otpCodeLength = 4;


  //progress indicator
  bool isLoading = false;

  //time display
  var timeDisplay = false;

  //Details
  var errorMessage = false;

  // Step 2
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);
  @override
  void initState() {
    super.initState();
  }

  /// Timer related methods ///
  // Step 3
  startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        setState(() {
          timeDisplay = false;
        });
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //check keyboard
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    //
    String strDigits(int n) => n.toString().padLeft(2, '0');

    //
    final minutes = strDigits(myDuration.inMinutes.remainder(2));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

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
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: width*0.04),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Icon(
                              EvaIcons.arrowIosBackOutline,
                              color: homeScreenColor,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: width*0.2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height*0.008,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: colorMain,
                                ),
                              ),
                              SizedBox(width: width*0.04,),
                              Container(
                                height: height*0.008,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: colorGrey.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(width: width*0.04,),
                              Container(
                                height: height*0.008,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: colorGrey.withOpacity(0.6),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                          left: width * 0.05,
                          right: width * 0.05,
                          top: height * 0.04),
                      child: Column(
                        children: <Widget>[
                          const Row(
                            children: [
                              Text('Verify Code',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25)),
                            ],
                          ),
                          SizedBox(
                            width: width * 1.0,
                            child: Text(
                              'Enter the code we just email you!',
                              style: TextStyle(
                                  fontSize: 12, color: colorBlack.withOpacity(0.7)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (errorMessage)
                                Row(
                                  children: [
                                    const Icon(
                                      EvaIcons.checkmarkCircle,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: width * .02,
                                    ),
                                    Text(
                                      'Verification Failed',
                                      style: TextStyle(
                                        color: colorBlack,
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                          //otp fields
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: PinFieldAutoFill(
                              currentCode: _otpCode,
                              codeLength: _otpCodeLength,
                              keyboardType: TextInputType.number,
                              decoration:  UnderlineDecoration(
                                textStyle:
                                const TextStyle(fontSize: 17, color: Colors.black),
                                colorBuilder: const FixedColorBuilder(Colors.grey),
                              ),
                              onCodeChanged: (code) {
                                if (code!.length == _otpCodeLength) {
                                  _otpCode = code;
                                  FocusScope.of(context).requestFocus(FocusNode());
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [if (timeDisplay) Text('$minutes: $seconds')],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.12,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Didn’t receive the code? ',
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Resend Code',
                                    style: TextStyle(
                                      color: colorRed,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      timeDisplay = true;
                                    });
                                    startTimer();
                                  },
                                ),
                              ],
                            ),
                          ),

                          if (!isKeyboard)
                            SizedBox(
                              height: height * 0.0,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                ),
                child: SizedBox(
                  height: height * 0.06,
                  width: width * 2.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: colorMain),
                    child: isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      // print(widget.firstName + widget.middleName +  widget.lastName + widget.phoneNumber + widget.email + widget.gander);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return const RegUser();
                      //     }));
                      // verifyOtp();
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
