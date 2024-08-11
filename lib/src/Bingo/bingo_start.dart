import 'dart:ui';

import 'package:bingolearn/src/Bingo/bingo_chat.dart';
import 'package:bingolearn/src/Bingo/bingo_translate.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../tools/colors.dart';

class BingoStart extends StatefulWidget {
  const BingoStart({super.key});

  @override
  State<BingoStart> createState() => _BingoStartState();
}

class _BingoStartState extends State<BingoStart> {
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
                    //Header
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
                        Column(
                          children: [
                            Gap(height * 0.02),
                            Text(
                              'Bingo.AI',
                              style: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Gap(height * .02),
                            Container(
                              height: height * .03,
                              width: width * .2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: colorBlue.withOpacity(0.35)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width * 0.02,
                                    child: Container(
                                      height: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: colorGreen,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ' Online',
                                    style: TextStyle(color: colorPrimary, fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * .05,
                        )
                      ],
                    ),
                    Gap(height * .12),
                    SizedBox(
                        width: width * .5,
                        height: height * .3,
                        child: Lottie.asset('assets/lottie/RobotAi.json')),
                    Gap(height * .04),
                    Column(
                      children: [
                        Text(
                          'Empowering Your',
                          style: TextStyle(
                              color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'Learning with AI',
                          style: TextStyle(
                              color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'Translate with Bingo, Learn with Bingo—Unlock Fun Learning with AI!.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorPrimary,),
                        ),

                      ],
                    ),
                    Gap(height*.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: height*.07,
                            width: width*.4,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                              color: colorPrimary
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: height*.07,
                                  width: width*.02,
                                  color: colorRed,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width*0.05 ),
                                  child: SizedBox(
                                    height: height * 0.03,
                                    child: SvgPicture.asset(
                                      'assets/icons/TranslateIconBlack.svg',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width*0.05 ),
                                  child: const Text('Translate',style: TextStyle(fontWeight: FontWeight.bold), ),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const BingoTranslate();
                                }));
                          },
                        ),
                        Gap(width*.02),
                        GestureDetector(
                          child: Container(
                            height: height*.07,
                            width: width*.4,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                color: colorPrimary
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width*0.03, top: height*0.014 ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Learn with',style: TextStyle(fontWeight: FontWeight.bold), ),
                                      Text('Bingo',style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width*0.03 ),
                                  child: SizedBox(
                                    height: height * 0.03,
                                    child: SvgPicture.asset(
                                      'assets/icons/BingoBlack.svg',
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height*.07,
                                  width: width*.02,
                                  color: colorBlue,
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const BingoChat();
                                }));
                          },
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
