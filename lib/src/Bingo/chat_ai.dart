import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../tools/colors.dart';

class ChatAI extends StatefulWidget {
  const ChatAI({super.key});

  @override
  State<ChatAI> createState() => _ChatAIState();
}

class _ChatAIState extends State<ChatAI> {
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

                    Gap(height * .02),
                    Container(
                      height: height * .035,
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
                            style: TextStyle(color: colorPrimary),
                          )
                        ],
                      ),
                    ),

                    Gap(height * .05),
                    Column(
                      children: [
                        SizedBox(
                          // margin: EdgeInsets.only(right: width*0.04, bottom: height*.025),
                          height: height * 0.03,
                          child: SvgPicture.asset(
                            'assets/icons/translateIcon.svg',
                          ),
                        ),
                        Gap(height*.01),
                        Text('Translate', style: TextStyle(color: colorPrimary ),)
                      ],
                    ),
                    Gap(height * .02),
                    Container(
                      height: height * .04,
                      width: width * .85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorGrey.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          'How do you say “How are you” in french?',
                          style: TextStyle(color: colorPrimary),
                        ),
                      ),
                    ),
                    Gap(height * .02),
                    Container(
                      height: height * .04,
                      width: width * .85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorGrey.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          'write a poem about flower and love',
                          style: TextStyle(color: colorPrimary),
                        ),
                      ),
                    ),
                    Gap(height*.02),
                    Column(
                      children: [
                        SizedBox(
                          // margin: EdgeInsets.only(right: width*0.04, bottom: height*.025),
                          height: height * 0.03,
                          child: SvgPicture.asset(
                            'assets/icons/conversationIcon.svg',
                          ),
                        ),
                        Text('Conversation', style: TextStyle(color: colorPrimary ),)
                      ],
                    ),
                    Gap(height * .02),
                    Container(
                      height: height * .04,
                      width: width * .85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorGrey.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          'Hi, What’s your name? ',
                          style: TextStyle(color: colorPrimary),
                        ),
                      ),
                    ),

                    Gap(height*.35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * .05,
                          width: width* .7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color:
                              colorGrey, //                   <--- border color
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width * .02),
                              ),
                              Gap(width*.01),
                              Flexible(
                                child: TextFormField(
                                  // controller: firstNameController,
                                  style: TextStyle(color: colorPrimary, fontSize: 12),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Type a prompt here... ',
                                      hintStyle: TextStyle(
                                          color: colorGrey, fontSize: 13),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                          child: SvgPicture.asset(
                            'assets/icons/recordIcon.svg',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                          child: SvgPicture.asset(
                            'assets/icons/sendIcon.svg',
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
