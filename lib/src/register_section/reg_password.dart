import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:bingolearn/src/register_section/selection_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../tools/colors.dart';


class RegPassword extends StatefulWidget {
  const RegPassword({super.key});

  @override
  State<RegPassword> createState() => _RegPasswordState();
}

class _RegPasswordState extends State<RegPassword> {
  //Error Message
  var errorMessage = false;

  //less then <2 Error Message
  var errorLessThen = false;
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
                              SizedBox(width: width*0.04,),
                              Container(
                                height: height*0.008,
                                width: width*0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: colorMain,
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
                              Text('Create Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25)),
                            ],
                          ),
                          SizedBox(
                            width: width * 1.0,
                            child: Text(
                              'Enter your chosen Password',
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
                                        color: colorBlack,
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (errorLessThen)
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
                                      'Invalid FirstName',
                                      style: TextStyle(
                                        color: colorBlack,
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
                                          EvaIcons.lockOutline,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: width*.02,),
                                      Flexible(
                                        child: TextFormField(
                                          // controller: firstNameController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              hintText: 'password',
                                              // prefixIcon: EvaIcons.emailOutline,
                                              hintStyle: TextStyle(color: colorGrey, fontSize: 15),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height*.02,),
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
                                          EvaIcons.lockOutline,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(width: width*.02,),
                                      Flexible(
                                        child: TextFormField(
                                          // controller: firstNameController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              hintText: 'Confirm Password',
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
                      'Finish',
                      style: TextStyle(color: colorPrimary),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const SelectionScreen();
                      }));
                },
                // onTap: () {
                //   if (firstNameController.text.isEmpty) {
                //     setState(() {
                //       errorMessage = true;
                //       errorLessThen = false;
                //     });
                //   } else if (firstNameController.text.length <= 2) {
                //     setState(() {
                //       errorMessage = false;
                //       errorLessThen = true;
                //     });
                //   } else {
                //     setState(() {
                //       errorMessage = false;
                //       errorLessThen = false;
                //     });
                //     // PageRouteTransition.curve;
                //     // PageRouteTransition.push(context, MName(firstName: firstNameController.text,));
                //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                //       return MName(firstName: firstNameController.text,
                //       );
                //     }));
                //   }
                // },
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          )),
    );
  }
}
