import 'package:bingolearn/src/Bingo/chat_ai.dart';
import 'package:bingolearn/src/Bingo/translate_ai.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../tools/colors.dart';


class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  //Instance of Gemini
  final gemini = Gemini.instance;

  TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          backgroundColor: colorMain,
          toolbarHeight: height * 0.09,
          elevation: 0,
          title: Column(
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

          leading: IconButton(
            icon: Icon(EvaIcons.arrowIosBackOutline, color: colorPrimary), // Set color
            onPressed: () {
              Navigator.pop(context);
            }, // Handle back navigation
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   color: const Color(0xFF06141B),
        //   height: height*.08,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         height: height * .05,
        //         width: width* .7,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(100),
        //           border: Border.all(
        //             color:
        //             colorGrey, //                   <--- border color
        //           ),
        //         ),
        //         child: Row(
        //           children: [
        //             Padding(
        //               padding: EdgeInsets.only(left: width * .02),
        //             ),
        //             Gap(width*.01),
        //             Flexible(
        //               child: TextFormField(
        //                 controller: promptController,
        //                 style: TextStyle(color: colorPrimary, fontSize: 12),
        //                 keyboardType: TextInputType.text,
        //                 decoration: InputDecoration(
        //                     hintText: 'Type a prompt here... ',
        //                     hintStyle: TextStyle(
        //                         color: colorGrey, fontSize: 13),
        //                     border: InputBorder.none),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: height * 0.03,
        //         child: SvgPicture.asset(
        //           'assets/icons/recordIcon.svg',
        //         ),
        //       ),
        //       GestureDetector(
        //         child: SizedBox(
        //           height: height * 0.03,
        //           child: SvgPicture.asset(
        //             'assets/icons/sendIcon.svg',
        //           ),
        //         ),
        //         onTap: (){
        //           _streamGenerativeContent();
        //         },
        //       ),
        //     ],
        //   ),
        // ),
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
                    GestureDetector(
                      child: Container(
                        height: height * .04,
                        width: width * .85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorGrey.withOpacity(0.2)),
                        child: Center(
                          child: Text(
                            'How do i say “How are you” in french?',
                            style: TextStyle(color: colorPrimary),
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context,
                            _translateRoute()
                        );
                      },
                    ),
                    Gap(height * .02),
                    GestureDetector(
                      child: Container(
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
                      onTap: (){

                      },
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
                    GestureDetector(
                      child: Container(
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
                      onTap: (){
                        Navigator.push(context,
                            _chatRoute()
                        );
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: GeminiResponseTypeView(
                              builder: ((context, child, response, loading) {
                                if (loading) {
                                  return SizedBox(
                                      width: width * .8,
                                      height: height * .13,
                                      child: Lottie.asset('assets/lottie/loading.json'));
                                }
                                if (response != null) {
                                  return Text(response, style: TextStyle(color: colorPrimary),);
                                }
                                return const SizedBox();
                              })),
                        ),
                      ),
                    ),

                  ],
                ))
          ],
        ));
  }

  //route translate
  Route _translateRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  const TranslateAi(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.elasticOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  //route chat
  Route _chatRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  const ChatAI(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.elasticOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  void _streamGenerativeContent() {
    // fruit = Globals.fruits[Random().nextInt(Globals.fruits.length)];
    final prompt = promptController.text;

    print(prompt);
    gemini.streamGenerateContent(prompt,generationConfig: GenerationConfig(
      temperature: 1,
    ) ).listen((event){});
    // gemini.streamGenerateContent(prompt,
    //     generationConfig: GenerationConfig(
    //       temperature: 1,
    //     ),
    //     safetySettings: [
    //       SafetySetting(
    //           category: SafetyCategory.hateSpeech,
    //           threshold: SafetyThreshold.blockLowAndAbove),
    //       SafetySetting(
    //           category: SafetyCategory.harassment,
    //           threshold: SafetyThreshold.blockLowAndAbove)
    //     ]).listen((event) {
    //   ref.read(Providers.uiStateNotifier.notifier).updateState(UIState.loaded);
    // });
  }
}
