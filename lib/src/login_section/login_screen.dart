import 'dart:async';

import 'package:bingolearn/src/login_section/login_ac_setup.dart';
import 'package:bingolearn/src/register_section/account_setup.dart';
import 'package:bingolearn/src/register_section/reg_email.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../core/api_section/api_service.dart';
import '../../core/local_store/shared_service.dart';
import '../../core/models/login/login_request.dart';
import '../dashboard/home_screen.dart';
import '../tools/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //password foiled visibility
  bool isPasswordVisible = true;

  //Error Message
  var errorEmail = false;
  var errorPassword = false;
  var errorMessage = false;
  var errorInvalidEmail = false;

  //less then <2 Error Message
  var errorLessThen = false;


//progress indicator
  bool isLoading = false;

  //Timer Circle indication
  Timer _timer = Timer(const Duration(), () {});

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }



  //controllers
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


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
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      height: height * .05,
                      width: width * .12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorSecondary.withOpacity(0.1)),
                      child: Center(
                        child: Icon(
                          EvaIcons.arrowIosBackOutline,
                          color: homeScreenColor,
                          size: 30,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  const Center(
                    child: Text(
                      'BingoLearn',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.04),
            child: Column(
              children: <Widget>[
                const Row(
                  children: [
                    Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ],
                ),
                // SizedBox(
                //   height: height * 0.01,
                // ),
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
                            'Invalid login details',
                            style: TextStyle(
                              color: colorRed,
                            ),
                          ),
                        ],
                      )
                  ],
                ),

                Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),

                      Container(
                        height: height * .06,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                colorGrey, //                   <--- border color
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * .02),
                              child: const Icon(
                                EvaIcons.emailOutline,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: width * .02,
                            ),

                            Flexible(
                              child: TextFormField(
                                key: const Key('AddEmail'),
                                controller: emailController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    // prefixIcon: EvaIcons.emailOutline,

                                    hintStyle: TextStyle(
                                        color: colorGrey, fontSize: 15),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(height*.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (errorEmail)
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
                                  'Email Can\'t be Empty' ,
                                  style: TextStyle(
                                    color: colorRed,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (errorInvalidEmail)
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
                                  'Invalid Email' ,
                                  style: TextStyle(
                                    color: colorRed,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        height: height * .06,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                colorGrey, //                   <--- border color
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * .02),
                              child: const Icon(
                                EvaIcons.lockOutline,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            Flexible(
                              child: TextFormField(
                                obscureText: isPasswordVisible,
                                controller: passwordController,
                                key: const Key('AddPassword'),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    // prefixIcon: EvaIcons.emailOutline,
                                    contentPadding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 13.0),
                                    suffixIcon: IconButton(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () {
                                          setState(() {
                                            isPasswordVisible = !isPasswordVisible;
                                          });
                                        },
                                        icon: isPasswordVisible
                                            ? const Icon(EvaIcons.eyeOutline)
                                            : const Icon(EvaIcons.eyeOffOutline)),
                                    hintStyle: TextStyle(
                                        color: colorGrey, fontSize: 15),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Gap(height*.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (errorPassword)
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
                                  'Password Can\'t be Empty' ,
                                  style: TextStyle(
                                    color: colorRed,
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                // if (!isKeyboard)
                //   SizedBox(
                //     height: height * .02,
                //   ),
                SizedBox(
                  height: height * .01,
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password',
                        style: TextStyle(color: colorBlue),
                      )
                    ],
                  ),
                  onTap: (){
                  },
                ),
                SizedBox(
                  height: height * .01,
                ),
                GestureDetector(
                  child:  SizedBox(
                    height: height * 0.06,
                    width: width ,
                    child: ElevatedButton(
                      key: const Key('LoginUser'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: colorMain),
                      child: isLoading
                          ? Transform.scale(
                        scale: 0.7,
                        child: CircularProgressIndicator(
                          backgroundColor: colorPrimary.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colorPrimary, //<-- SEE HERE
                          ),
                        ),
                      )
                          : const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        if (emailController.text.isEmpty) {
                          setState(() {
                            errorEmail = true;
                            errorPassword = false;
                            errorInvalidEmail = false;
                          });
                        } else if (!emailController.text.contains('@')) {
                          setState(() {
                            errorInvalidEmail = true;
                            errorEmail = false;
                            errorPassword = false;
                          });
                        } else if (passwordController.text.isEmpty) {
                          setState(() {
                            errorEmail = false;
                            errorPassword = true;
                            errorInvalidEmail = false;
                          });
                        } else {
                          setState(() {
                            errorMessage = false;
                            errorPassword = false;
                            errorEmail = false;
                            errorInvalidEmail = false;
                          });
                          loginSubmit();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have and account?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colorBlue),
                    ),

                      onTap: (){

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const RegEmail();
                            }));
                      },
                    ),

                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }


  loginSubmit() {
    setState(() {
      isLoading = true;
      errorMessage = false;
    });
    LoginRequest model = LoginRequest(
        email: emailController.text, password: passwordController.text);

    ApiService.login(model).then((response) => {
      if (response)
        {
          // print(response),
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginAcSetup()),
                  (route) => false),
          setState(() {
            isLoading = false;
          })
        }
      else
        {
          setState(() {
            errorMessage = true;
          })
        }
    });
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
