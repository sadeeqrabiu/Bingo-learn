import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:bingolearn/src/lesson/lesson_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class LessonComplete extends StatefulWidget {
  const LessonComplete({super.key});

  @override
  State<LessonComplete> createState() => _LessonCompleteState();
}

class _LessonCompleteState extends State<LessonComplete> {
  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          backgroundColor: colorMain,
          toolbarHeight: height * 0.02,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                // image: DecorationImage(image: AssetImage("assets/block.png"), fit: BoxFit.cover,),
                gradient: LinearGradient(
                    colors: [Color(0xFF11212D), Color(0xFF06141B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
            //
            Padding(
                padding: EdgeInsets.only(left: width * .05, right: width * .05),
                child: Column(
                  children: [
                    Gap(height * .2),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            // margin: EdgeInsets.only(right: width*0.04, bottom: height*.025),
                            height: height * 0.17,
                            child: SvgPicture.asset(
                              'assets/svgs/BingoOne.svg',
                            ),
                          ),
                          Gap(height*.02),
                          Text(
                            'Lesson Completed',
                            style: TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          Gap(height*.05),
                          Container(
                            height: height*.05,
                            width: width*.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorPrimary)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: width*.02),
                              child: Row(
                                children: [
                                  Text('Star: 4', style: TextStyle(color: colorPrimary ),)
                                ],
                              ),
                            ),
                          ),
                          Gap(height*.04),
                          Container(
                            height: height*.05,
                            width: width*.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorPrimary)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: width*.02),
                              child: Row(
                                children: [
                                  Text('Time: 10min', style: TextStyle(color: colorPrimary ),)
                                ],
                              ),
                            ),
                          ),
                          Gap(height*.04),
                          Container(
                            height: height*.05,
                            width: width*.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorPrimary)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: width*.02),
                              child: Row(
                                children: [
                                  Text('Score: 6/10', style: TextStyle(color: colorPrimary ),)
                                ],
                              ),
                            ),
                          ),

                          Gap(height*.08),
                          GestureDetector(
                            child: Container(
                              height: height*.05,
                              width: width*.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorGrey.withOpacity(0.2)
                              ),
                              child: Center(child: Text('Completed', style: TextStyle(color: colorPrimary ),)),
                            ),
                            onTap: (){
                              //
                              ///
                              /////
                              /////This should not return back
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const HomeScreen();
                                  }));
                            },
                          ),
                        ],
                      ),
                    ),

                  ],
                ))
          ],
        ));
  }
}
