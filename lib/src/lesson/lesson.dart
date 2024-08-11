import 'dart:math';

import 'package:bingolearn/core/lession/lesson_data.dart';
import 'package:bingolearn/core/lession/lesson_model.dart';
import 'package:bingolearn/src/lesson/lesson_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../tools/colors.dart';


class Lesson extends StatefulWidget {
  const Lesson({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String? language;

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {

  //
  final gemini = Gemini.instance;


  //
  int lessonCounter = 0;
  //

  //
  final controller = TextEditingController();

  late  LessonModel lessonModel;

  // FlutterTts flutterTts = FlutterTts();

  final flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamGenerativeContent();
  }


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
                          height: height*.01,
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
                              height: height * 0.028,
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
                      child: Text(controller.text, style: TextStyle(color: colorPrimary, fontSize: 15),),
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
                          padding: EdgeInsets.only(left: width*.05, right: width*.05, bottom: height*0.04),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: SizedBox(
                                  height: height * 0.03,
                                  child: SvgPicture.asset(
                                    'assets/icons/speakerIcon.svg',
                                  ),
                                ),
                                onTap: (){
                                  // flutterTts.speak(controller.text);
                                  speak(controller.text);
                                  debugPrint(controller.text);
                                },
                              ),
                              Gap(width*.0),
                              Padding(
                                padding:  EdgeInsets.only(bottom: height*.032, left: width*0.03 ),
                                child: GeminiResponseTypeView(
                                    builder: ((context, child, response, loading) {
                                      if (loading) {
                                        return Center(
                                          child: SizedBox(
                                              width: width * .1,
                                              height: height * .05,
                                              child: Lottie.asset(
                                                  'assets/lottie/loading.json')),
                                        );
                                      }
                                      if (response != null) {
                                        return Text(
                                          response,
                                          style: TextStyle(color: colorPrimary),
                                        );
                                      }
                                      return const SizedBox();
                                    })),
                              ),
                            ],
                          ),
                        ),
                      )
                    ),

                    Gap(height*.1),
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
                            child: Text('Next', style: TextStyle(color: colorPrimary),),
                          ),
                        ),
                        onTap: (){
                          lessonCounter++;
                          _lessonCounter();
                          // _streamGenerativeContent();

                        },
                      ),
                    )
                  ],
                ))
          ],
        ));
  }

  void _lessonCounter(){
    debugPrint(lessonCounter.toString());
    if(lessonCounter != 10){
      _streamGenerativeContent();
    }else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return const LessonComplete();
          }));
    }
  }
  void _streamGenerativeContent() {
    lessonModel = LessonData.lessons[Random().nextInt(LessonData.lessons.length)];

    setState(() {
      controller.text = lessonModel.phase;
    });

    final prompt =
        'What\'s "${controller.text}" in ${widget.language}';

    print(prompt);
    gemini.streamGenerateContent(prompt,
        generationConfig: GenerationConfig(
          temperature: 1,
        ),
        safetySettings: [
          SafetySetting(
              category: SafetyCategory.hateSpeech,
              threshold: SafetyThreshold.blockLowAndAbove),
          SafetySetting(
              category: SafetyCategory.harassment,
              threshold: SafetyThreshold.blockLowAndAbove)
        ]).listen((event) {
      // ref.read(Providers.uiStateNotifier.notifier).updateState(UIState.loaded);
    });
  }
}
