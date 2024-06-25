import 'package:bingolearn/src/lesson/lesson_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';


class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
                        Container(
                          height: height*.015,
                          width: width*.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorGrey
                          ),
                        ),

                        GestureDetector(
                          child: SizedBox(
                            width: width * 0.10,
                            child: Container(
                              height: height * 0.035,
                              decoration: BoxDecoration(
                                border: Border.all(color: colorPrimary, width: 2),
                                shape: BoxShape.circle,
                                // image: DecorationImage(
                                //     image: NetworkImage(profileModel.profileImg),
                                //     fit: BoxFit.cover),
                              ),
                              child:  SizedBox(
                                child: SvgPicture.asset(
                                  'assets/icons/cancelIcon.svg',
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    Gap(height*.06),
                    Center(
                      child: Text("Hello how are you!", style: TextStyle(color: colorPrimary, fontSize: 15),),
                    ),
                    Gap(height*.02),
                    Container(
                      height: height * .13,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorGrey.withOpacity(0.2)),

                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(left: width*.05, right: width*.05, top: height*.02),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.03,
                                child: SvgPicture.asset(
                                  'assets/icons/speakerIcon.svg',
                                ),
                              ),
                              Gap(width*.02),
                              Text('Bonjour Comment ça va', style: TextStyle(color: colorPrimary),)
                            ],
                          ),
                        ),
                      )
                    ),
                    Gap(height*.04),
                    Padding(
                      padding: EdgeInsets.only(left: width*.1, right: width*.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height*.04,
                            width: width*.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: colorPrimary, width: 1),
                            ),
                            child: Center(
                              child: Text('Bonjour', style: TextStyle(
                                color: colorPrimary
                              ),),
                            ),
                          ),
                          Container(
                            height: height*.04,
                            width: width*.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: colorPrimary, width: 1),
                            ),
                            child: Center(
                              child: Text('Çava', style: TextStyle(
                                  color: colorPrimary
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(height*.02),
                    Padding(
                      padding: EdgeInsets.only(left: width*.1, right: width*.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height*.04,
                            width: width*.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: colorPrimary, width: 1),
                            ),
                            child: Center(
                              child: Text('Bonjour', style: TextStyle(
                                  color: colorPrimary
                              ),),
                            ),
                          ),
                          Container(
                            height: height*.04,
                            width: width*.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: colorPrimary, width: 1),
                            ),
                            child: Center(
                              child: Text('Çava', style: TextStyle(
                                  color: colorPrimary
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(height*.45),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        child: Container(
                          height: height*.04,
                          width: width* .3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorGrey.withOpacity(0.2),

                          ),
                          child: Center(
                            child: Text('Check', style: TextStyle(color: colorPrimary),),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const LessonComplete();
                              }));
                        },
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
