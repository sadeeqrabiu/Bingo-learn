import 'package:bingolearn/src/Bingo/chat_ai.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
                        Text(
                          'Bingo.AI',
                          style: TextStyle(
                              color: colorPrimary, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: width * .05,
                        )
                      ],
                    ),
                    Gap(height * .12),
                    SizedBox(
                      // margin: EdgeInsets.only(right: width*0.04, bottom: height*.025),
                      height: height * 0.35,
                      child: SvgPicture.asset(
                        'assets/svgs/BingoAi.svg',
                      ),
                    ),
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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla turpis sapien, dignissim vel dolor aliquet, dictum egestas lectus.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorPrimary,),
                        ),

                      ],
                    ),
                    Gap(height*.12),
                    GestureDetector(
                      child: Container(
                        height: height*.05,
                        width: width*.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary
                        ),
                        child: const Center(
                          child: Text('Get Started', ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const ChatAI();
                            }));
                      },
                    )
                  ],
                ))
          ],
        ));
  }
}
