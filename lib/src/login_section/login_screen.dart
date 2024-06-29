import 'package:bingolearn/src/register_section/reg_email.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

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

  //less then <2 Error Message
  var errorLessThen = false;


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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password',
                      style: TextStyle(color: colorBlue),
                    )
                  ],
                ),
                SizedBox(
                  height: height * .01,
                ),
                GestureDetector(
                  child: Container(
                    height: height * 0.06,
                    // margin: EdgeInsets.only(
                    //   left: width * 0.05,
                    //   right: width * 0.05,
                    // ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorMain),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: colorPrimary),
                      ),
                    ),
                  ),
                  // onTap: (){
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) {
                  //         return const HomeScreen();
                  //       }));
                  // },
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      setState(() {
                        errorEmail = true;
                        errorPassword = false;
                      });
                    } else if (passwordController.text.isEmpty) {
                      setState(() {
                        errorEmail = false;
                        errorPassword = true;
                      });
                    } else {
                      setState(() {
                        errorMessage = false;
                        errorPassword = false;
                        errorEmail = false;
                      });
                      // PageRouteTransition.curve;
                      // PageRouteTransition.push(context, MName(firstName: firstNameController.text,));
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    }
                  },
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
}
