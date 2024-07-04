import 'package:bingolearn/core/models/sign_up/sign_up_response.dart';
import 'package:bingolearn/core/models/sign_up/sign_up_user.dart';
import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:bingolearn/src/register_section/account_setup.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class LearningGoal extends StatefulWidget {
  const LearningGoal({
    Key? key,
    required this.language,
    required this.flag,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  final String? language;
  final String? flag;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;

  @override
  State<LearningGoal> createState() => _LearningGoalState();
}

class _LearningGoalState extends State<LearningGoal> {
  var isClicked = false;

  //15min
  Color aColor = colorPrimary;
  Color atColor = colorBlack;

  //20min
  Color bColor = colorPrimary;
  Color btColor = colorBlack;

  //30min
  Color cColor = colorPrimary;
  Color ctColor = colorBlack;

  int firstTime = 15;
  int secondTime = 20;
  int thirdTime = 30;

  TextEditingController firstTimeController = TextEditingController();
  TextEditingController secondTimeController = TextEditingController();
  TextEditingController thirdTimeController = TextEditingController();

  //

  SignUpResponseModel userID = SignUpResponseModel(id: '');
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
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
            margin: EdgeInsets.only(
                top: height * 0.04, right: width * 0.07, left: width * 0.07),
            child: Column(
              children: [
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'What’s your daily',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text('learning goals?',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: height * 0.04,
                              width: width * .1,
                              decoration: BoxDecoration(
                                color: colorSecondary,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(widget.flag!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: width * .02,
                            ),
                            Text(
                              widget.language!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorBlack),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(height * 0.02),
                    GestureDetector(
                      child: Container(
                        height: height * .053,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorGrey.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(10),
                          color: aColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: width * .04, left: width * .04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '15min / day',
                                style: TextStyle(color: atColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        firstTimeController.text = firstTime.toString();
                        print(firstTimeController.text);
                        setState(() {
                          aColor =
                              aColor == colorPrimary ? colorMain : colorPrimary;
                          atColor = atColor == colorPrimary
                              ? colorBlack
                              : colorPrimary;
                        });
                      },
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    GestureDetector(
                      child: Container(
                        height: height * .053,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorGrey.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(10),
                          color: bColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: width * .04, left: width * .04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '20min / day',
                                style: TextStyle(color: btColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        secondTimeController.text = secondTime.toString();
                        print(secondTimeController.text);
                        setState(() {
                          bColor =
                              bColor == colorPrimary ? colorMain : colorPrimary;
                          btColor = btColor == colorPrimary
                              ? colorBlack
                              : colorPrimary;
                        });
                      },
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    GestureDetector(
                      child: Container(
                        height: height * .053,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorGrey.withOpacity(0.9)),
                          borderRadius: BorderRadius.circular(10),
                          color: cColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: width * .04, left: width * .04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '30min / day',
                                style: TextStyle(color: ctColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        thirdTimeController.text = thirdTime.toString();
                        print(thirdTimeController.text);
                        setState(() {
                          cColor =
                              cColor == colorPrimary ? colorMain : colorPrimary;
                          ctColor = ctColor == colorPrimary
                              ? colorBlack
                              : colorPrimary;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: height * .4),
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
                        'Continue',
                        style: TextStyle(color: colorPrimary),
                      ),
                    ),
                  ),
                  onTap: () {
                    debugPrint('verify Email : ${widget.firstName!}${widget.middleName!}${widget.lastName!}${widget.email!}${widget.language!} ${widget.flag!}${firstTimeController.text + secondTimeController.text + thirdTimeController.text}');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AccountSetup(
                        firstName: widget.firstName,
                        middleName: widget.middleName,
                        lastName: widget.lastName,
                        email: widget.email,
                        language: 'English',
                        lLanguage: widget.language,
                        learningGoal: firstTimeController.text + secondTimeController.text + thirdTimeController.text,
                        learningFlag: widget.flag,
                      );
                    }));
                  },
                ),
              ],
            )),
      )),
    );
  }
}
