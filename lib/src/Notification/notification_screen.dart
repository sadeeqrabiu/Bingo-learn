import 'package:bingolearn/src/tools/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        toolbarHeight: height * 0.02,
        elevation: 0,
        // leading: BackButton(
        //   color: colorWhite, // <-- SEE HERE
        // ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      EvaIcons.arrowIosBackOutline,
                      color: colorBlack,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  'Notification',
                  style: TextStyle(
                      color: colorBlack,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                //Bell Container
                SizedBox(
                  width: width * 0.15,
                  height: height * 0.06,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: width * 0.05, left: width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  GestureDetector(
                    child: Container(
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorPrimary,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.15),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03,
                            right: width * 0.05,
                            top: height * 0.02),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.03,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: backgroundColor),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Text(
                                  'Welcome to Bingo Learn ',
                                  style: TextStyle(color: colorSecondary),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.045),
                              child: const Text(
                                'We\'re excited to have you on board. Take some time to explore through our features and see what we have to offer.',
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: width*0.045),
                            //   child: Row(
                            //     children: [
                            //       Text('Tue, 3:45PM', style: TextStyle(color: colorGrey),)
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return const BookingPayment();
                      //     }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
