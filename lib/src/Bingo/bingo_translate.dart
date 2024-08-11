import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../core/api_section/api_service.dart';
import '../../core/models/user/usesr_data.dart';
import '../tools/colors.dart';



class BingoTranslate extends StatefulWidget {
  const BingoTranslate({super.key});

  @override
  State<BingoTranslate> createState() => _BingoTranslateState();
}

class _BingoTranslateState extends State<BingoTranslate> {
  //Gemini Instance
  final gemini = Gemini.instance;
  final controller = TextEditingController();

  //Text-to-speech
  final flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  TextEditingController responseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // checkTime();
    getUser();
  }

  //List of user Data for language
  List<UserDataListModel>? _userLanguage;

  TextEditingController userPrompt = TextEditingController();


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
                'Translate',
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Gap(height * .03),
            ],
          ),
          leading: IconButton(
            icon: Icon(EvaIcons.arrowIosBackOutline, color: colorPrimary), // Set color
            onPressed: () {
              Navigator.pop(context);
            }, // Handle back navigation
          ),
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
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.only(left: width * .08, right: width * .08),
                  child: Column(
                    children: [
                      Container(
                        height: height*0.25,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorPrimary.withOpacity(0.2)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('English--', style: TextStyle(color: colorPrimary, fontSize: 10, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width*.02, right: width*.02),
                              child: Row(
                                children: [
                                  Gap(width*.0),
                                  Flexible(
                                    child: TextFormField(
                                      controller: userPrompt,
                                      style: TextStyle(color: colorPrimary, fontSize: 15),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Text..',
                                          hintStyle: TextStyle(
                                              color: colorGrey, fontSize: 14),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: SizedBox(
                                      height: height * 0.02,
                                      child: SvgPicture.asset(
                                        'assets/icons/sendIcon.svg',
                                      ),
                                    ),
                                    onTap: (){
                                      _streamGenerativeContent();
                                      userPrompt.clear();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //Divider
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(thickness: 1, color: colorPrimary, endIndent: 5, ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: width*.02, right: width*.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text( '${_userLanguage?[0].lLanguage}--', style: TextStyle(color: colorPrimary, fontWeight: FontWeight.bold, fontSize: 10),),
                                  GestureDetector(
                                    child: SizedBox(
                                      height: height * 0.02,
                                      child: SvgPicture.asset(
                                        'assets/icons/recordIcon.svg',
                                      ),
                                    ),
                                    onTap: (){
                                      speak(responseController.text);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Gap(height*.01),
                            Padding(
                              padding: EdgeInsets.only(left: width*0.02, right: width*.02),
                              child: SizedBox(
                                width: width,
                                child: Row(
                                  children: [
                                    SingleChildScrollView(
                                      child: GeminiResponseTypeView(
                                          builder: ((context, child, response, loading) {

                                            if (loading) {
                                              return Center(
                                                child: SizedBox(
                                                    width: width * .2,
                                                    height: height * .05,
                                                    child: Lottie.asset(
                                                        'assets/lottie/loading.json')),
                                              );
                                            }
                                            if (response != null) {
                                              responseController.text = response;
                                              return SizedBox(
                                                width: width*0.8,
                                                child: Text(
                                                  response,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: TextStyle(color: colorPrimary, fontSize: 15),
                                                ),
                                              );
                                            }
                                            return const SizedBox();
                                          })),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  )),
            )
          ],
        ));
  }
  void _streamGenerativeContent() {

    final promptInstruction =
        '**System Instructions:**'
        '* **Role:** Language translation'
        '* **Language:** ${_userLanguage?[0].lLanguage}'
        '* **Response Style:**'
        '* Use plain text without asterisks (***) using any other formatting that the user will understand.'
        '* what\'s ${userPrompt.text} in ${_userLanguage?[0].lLanguage}';

    String userConversation = promptInstruction + userPrompt.text;
    // print(prompt);
    gemini.streamGenerateContent(userConversation,
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

  //getting user Language from Api
  Future<void> getUser() async {
    try {
       _userLanguage = await ApiService.getUserData();
      setState(() {
        _userLanguage = _userLanguage;
      });
    } on Exception catch (error) {
      debugPrint('Failed to fetch user data: $error');
    }
  }
}
