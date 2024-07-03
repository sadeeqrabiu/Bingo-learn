import 'package:bingolearn/src/register_section/reg_password.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class RegUser extends StatefulWidget {
  const RegUser({Key? key, required this.email}) : super(key: key);

  final String? email;

  @override
  State<RegUser> createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
  //Error Message
  var errorFName = false;
  var errorLName = false;

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();

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
                  padding: EdgeInsets.only(left: width * 0.04),
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
                      SizedBox(
                        width: width * 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height * 0.008,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: colorGrey.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Container(
                            height: height * 0.008,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: colorMain,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Container(
                            height: height * 0.008,
                            width: width * 0.1,
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
                          Text('Your Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ],
                      ),
                      SizedBox(
                        width: width * 1.0,
                        child: Text(
                          'Enter your full name',
                          style: TextStyle(
                              fontSize: 12, color: colorBlack.withOpacity(0.7)),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Form(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
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
                                      EvaIcons.personOutline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      controller: fNameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'First Name',
                                          // prefixIcon: EvaIcons.emailOutline,
                                          hintStyle: TextStyle(
                                              color: colorGrey, fontSize: 15),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(height * .005),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (errorFName)
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
                            SizedBox(
                              height: height * .01,
                            ),
                            const Row(
                              children: [Text('Optional')],
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
                                      EvaIcons.personOutline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      controller: mNameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Middle Name',
                                          // prefixIcon: EvaIcons.emailOutline,

                                          hintStyle: TextStyle(
                                              color: colorGrey, fontSize: 15),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
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
                                      EvaIcons.personOutline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      controller: lNameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Last Name',
                                          // prefixIcon: EvaIcons.emailOutline,
                                          hintStyle: TextStyle(
                                              color: colorGrey, fontSize: 15),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(height * .005),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (errorLName)
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
                  borderRadius: BorderRadius.circular(10), color: colorMain),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(color: colorPrimary),
                ),
              ),
            ),
            onTap: () {
              if (fNameController.text.isEmpty) {
                setState(() {
                  errorFName = true;
                });
              } else if (lNameController.text.isEmpty) {
                setState(() {
                  errorLName = true;
                  errorFName = false;
                });
              } else {
                setState(() {
                  errorLName = false;
                  errorFName = false;
                });
                Navigator.push(context, _createRoute());
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

  //route
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => RegPassword(
        firstName: fNameController.text,
        middleName: mNameController.text,
        lastName: lNameController.text,
        email: widget.email,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.elasticOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
