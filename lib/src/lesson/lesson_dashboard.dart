import 'package:bingolearn/src/lesson/lesson.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class LessonDashboard extends StatefulWidget {
  const LessonDashboard({super.key});

  @override
  State<LessonDashboard> createState() => _LessonDashboardState();
}

class _LessonDashboardState extends State<LessonDashboard> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(
                            EvaIcons.arrowIosBackOutline,
                            color: colorPrimary,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Gap(width * .15),
                        Row(
                          children: [
                            SizedBox(
                              height: height * 0.03,
                              child: SvgPicture.asset(
                                'assets/icons/fireIcon.svg',
                              ),
                            ),
                            Gap(width * .01),
                            Text(
                              '0',
                              style: TextStyle(color: colorPrimary),
                            ),
                            Gap(width * .05),
                            SizedBox(
                              height: height * 0.03,
                              child: SvgPicture.asset(
                                'assets/icons/shieldIcon.svg',
                              ),
                            ),
                            Gap(width * .01),
                            Text(
                              '1/10',
                              style: TextStyle(color: colorPrimary),
                            ),
                            Gap(width * .05),
                            SizedBox(
                              height: height * 0.03,
                              child: SvgPicture.asset(
                                'assets/icons/heartIcon.svg',
                              ),
                            ),
                            Gap(width * .01),
                            Text(
                              '5',
                              style: TextStyle(color: colorPrimary),
                            ),
                            Gap(width * .1),
                            Icon(
                              EvaIcons.bellOutline,
                              color: colorPrimary.withOpacity(0.7),
                            )
                          ],
                        ),
                      ],
                    ),
                    Gap(height * .04),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.13,
                          child: Container(
                            height: height * 0.065,
                            decoration: BoxDecoration(
                              color: colorSecondary,
                              shape: BoxShape.circle,
                              // image: DecorationImage(
                              //     image: NetworkImage(profileModel.profileImg),
                              //     fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Gap(width*.01),
                        Text('French', style: TextStyle(color: colorPrimary, fontSize: 15,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    //Card
                    Gap(height * .01),
                    Container(
                      height: height * .13,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorGrey.withOpacity(0.2)),

                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(left: width*.05, right: width*.05, top: height*.005),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Level 1', style: TextStyle(color: colorPrimary, fontSize: 15,fontWeight: FontWeight.bold))
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: width*0.1, right: width*.1, top: height*.01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [ //Words min
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Container(
                                        height: height * 0.07,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: colorBlueSecond.withOpacity(0.5), width: 3),
                                          color: colorSecondary,
                                          shape: BoxShape.circle,
                                          // image: DecorationImage(
                                          //     image: NetworkImage(profileModel.profileImg),
                                          //     fit: BoxFit.cover),
                                        ),
                                        child:  Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('40', style: TextStyle(color: colorPrimary, fontSize: 11,)),
                                              Text('min',style: TextStyle(color: colorPrimary, fontSize: 11,))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                                 //Words count
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Container(
                                        height: height * 0.07,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: colorYellow.withOpacity(0.5), width: 3),
                                          color: colorSecondary,
                                          shape: BoxShape.circle,
                                          // image: DecorationImage(
                                          //     image: NetworkImage(profileModel.profileImg),
                                          //     fit: BoxFit.cover),
                                        ),
                                        child:  Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('36', style: TextStyle(color: colorPrimary, fontSize: 11,fontWeight: FontWeight.bold)),
                                              Text('words', style: TextStyle(color: colorPrimary, fontSize: 11,fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                           //Words Phases
                                    SizedBox(
                                      width: width * 0.15,
                                      child: Container(
                                        height: height * 0.07,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: colorRed.withOpacity(0.4), width: 3),
                                          color: colorSecondary,
                                          shape: BoxShape.circle,
                                          // image: DecorationImage(
                                          //     image: NetworkImage(profileModel.profileImg),
                                          //     fit: BoxFit.cover),
                                        ),
                                        child:  Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('20', style: TextStyle(color: colorPrimary, fontSize: 11,fontWeight: FontWeight.bold)),
                                              Text('phrases',  style: TextStyle(color: colorPrimary, fontSize: 09,fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(height*.01),
                    Row(
                      children: [
                        Text('Lesson Library ', style: TextStyle(color: colorPrimary, fontSize: 15,fontWeight: FontWeight.bold))
                      ],
                    ),
                    Gap(height*.01),
                    GestureDetector(
                      child: Container(
                        height: height*.06,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: width*.02, right: width*.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: height*.02,
                                    width: width*.05,
                                    color: colorGrey,
                                  ),
                                  Gap(width*.02),
                                  const Text('Hello'),
                                ],
                              ),

                              SizedBox(
                                height: height*.02,
                                width: width*.05,
                              ),

                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const Lesson();
                              }));
                      },
                    ),

                  ],
                ))
          ],
        ));
  }
}
