import 'package:bingolearn/src/lesson/lesson.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../tools/colors.dart';

class LessonDashboard extends StatefulWidget {
  const LessonDashboard({

    Key? key,
    required this.language,
    required this.flag,
    required this.min
  }) : super(key: key);

  final String? language;
  final String? flag;
  final String? min;

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
                          width: width * 0.1,
                          child: Container(
                            height: height * 0.06,
                            decoration: BoxDecoration(
                              color: colorSecondary,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage('${widget.flag}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Gap(width*.02),
                        Text('${widget.language}', style: TextStyle(color: colorPrimary, fontSize: 15,fontWeight: FontWeight.bold),)
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
                                          border: Border.all(color: colorBlueSecond.withOpacity(0.5), width: 6),
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
                                              Text('${widget.min}', style: TextStyle(color: colorPrimary, fontSize: 11,)),
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
                                          border: Border.all(color: colorYellow.withOpacity(0.5), width: 6),
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
                                          border: Border.all(color: colorRed.withOpacity(0.4), width: 6),
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
                                              Text('10', style: TextStyle(color: colorPrimary, fontSize: 11,fontWeight: FontWeight.bold)),
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
                                  SizedBox(
                                    height: height * 0.03,
                                    child: SvgPicture.asset(
                                      'assets/svgs/HelloIcon.svg',
                                    ),
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
                                return  Lesson(language: widget.language,);
                              }));
                      },
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
                                  SizedBox(
                                    height: height * 0.03,
                                    child: SvgPicture.asset(
                                      'assets/svgs/SentenceIcon.svg',
                                    ),
                                  ),
                                  Gap(width*.02),
                                  const Text('Sentence'),
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
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //       return const Lesson();
                        //     }));
                        dialogBox();
                      },
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
                                  SizedBox(
                                    height: height * 0.03,
                                    child: SvgPicture.asset(
                                      'assets/svgs/NumbersIcon.svg',
                                    ),
                                  ),
                                  Gap(width*.02),
                                  const Text('Numbers'),
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
                        dialogBox();
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) {
                      //         return const Lesson();
                      //       }));
                      },
                    ),

                  ],
                ))
          ],
        ));
  }
  //Alert Dialog
  dialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          //Media Query
          final double height = MediaQuery.of(context).size.height;
          final double width = MediaQuery.of(context).size.width;
          return Dialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: colorPrimary,
            child: SizedBox(
              height: height * 0.15,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                        child: Column(
                          children: [
                            Text(
                              'Lesson not available',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * .15,
                          right: width * .15,
                          top: height * .02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: height * .035,
                              width: width * .2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorSecondary),
                                color: colorPrimary,
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: colorBlack),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
