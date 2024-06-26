import 'package:bingolearn/src/game/flash_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class GameStart extends StatefulWidget {
  const GameStart({super.key});

  @override
  State<GameStart> createState() => _GameStartState();
}

class _GameStartState extends State<GameStart> {
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
                          'Game',
                          style: TextStyle(
                              color: colorPrimary, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: width * .07,
                        )
                      ],
                    ),

                    Gap(height * .02),
                    Column(
                      children: [
                        SizedBox(
                          height: height * 0.15,
                          child: SvgPicture.asset(
                            'assets/icons/cardIcon.svg',
                          ),
                        ),
                        Text(
                          'Flash Card Game',
                          style: TextStyle(
                              color: colorPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Gap(height * .02),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla turpis sapien, dignissim vel dolor aliquet, dictum egestas lectus. ',
                      style: TextStyle(color: colorPrimary),
                    ),

                    Gap(height*.05),
                    GestureDetector(
                      child: Container(
                        height: height*.04,
                        width: width*.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary
                        ),
                        child: const Center(
                          child: Text('Start Game'),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const FlashCard();
                            }));
                      },
                    )
                  ],
                ))
          ],
        ));
  }
}
