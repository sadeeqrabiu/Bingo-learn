import 'package:bingolearn/src/register_section/reg_otp.dart';
import 'package:bingolearn/src/register_section/reg_user.dart';
import 'package:bingolearn/src/tools/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class RegEmail extends StatefulWidget {
  const RegEmail({super.key});

  @override
  State<RegEmail> createState() => _RegEmailState();
}

class _RegEmailState extends State<RegEmail> {

  //Error Message
  var errorMessage = false;

  //less then <2 Error Message
  var errorInvalidEmail = false;


  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //check keyboard
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

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
                              Text('Email',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25)),
                            ],
                          ),
                          SizedBox(
                            width: width * 1.0,
                            child: Text(
                              'Enter your phone Email',
                              style: TextStyle(
                                  fontSize: 12, color: colorBlack.withOpacity(0.7)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
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
                                      'Field can\'t be empty',
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
                                      'Invalid email address',
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
                                  height: height * 0.02,
                                ),
                                Container(
                                  height: height*.06,
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: colorGrey, //                   <--- border color
                                    ),
                                  ),
                                  child: Row(
                                    children: [

                                       Padding(
                                        padding: EdgeInsets.only(left: width*.02),
                                        child: const Icon(
                                          EvaIcons.emailOutline,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: width*.02,),
                                      Flexible(
                                        child: TextFormField(
                                          controller: emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText: 'Email',
                                              // prefixIcon: EvaIcons.emailOutline,

                                              hintStyle: TextStyle(color: colorGrey, fontSize: 15),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!isKeyboard)
                            SizedBox(
                              height: height * .0,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                child: Container(
                  height: height * 0.06,
                  margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorMain),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: colorPrimary),
                    ),
                  ),
                ),
                onTap: () {
                  if (emailController.text.isEmpty) {
                    setState(() {
                      errorMessage = true;
                      errorInvalidEmail = false;
                    });
                  } else if (!emailController.text.contains('@')) {
                    setState(() {
                      errorMessage = false;
                      errorInvalidEmail = true;
                    });
                  } else {
                    errorMessage = false;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const RegUser();
                        }));
                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          )),
    );
  }
}
