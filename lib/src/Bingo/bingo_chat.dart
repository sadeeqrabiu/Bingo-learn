import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../core/api_section/api_service.dart';
import '../../core/models/user/usesr_data.dart';
import '../tools/colors.dart';



class BingoChat extends StatefulWidget {
  const BingoChat({
    super.key});

  @override
  State<BingoChat> createState() => _BingoChatState();
}

class _BingoChatState extends State<BingoChat> {
  //Gemini Instance
  final gemini = Gemini.instance;
  final controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    // checkTime();
    // fetchData();
    getUser();
    _welcomeUser();
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                width: width * 0.08,
                child: Container(
                  height: height * 0.04,
                  decoration: BoxDecoration(
                      color: colorSecondary,
                      shape: BoxShape.circle,
                      image: _userLanguage != null && _userLanguage!.isNotEmpty ? DecorationImage(
                          image: NetworkImage('${_userLanguage?[0].learningFlag}'),
                          fit: BoxFit.cover) : null
                  ),
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
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: width * .05, right: width * .05),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height * .06,
                                width: width* .7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width * .02, right: width * .02),
                                    ),
                                    Gap(width*.01),
                                    Flexible(
                                      child: TextFormField(
                                        controller: userPrompt,
                                        style: TextStyle(color: colorPrimary, fontSize: 13, fontWeight: FontWeight.bold),
                                        keyboardType: TextInputType.text,
                                        maxLines: 5,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: 'Type a prompt here... ',
                                            hintStyle: TextStyle(
                                                color: colorGrey, fontSize: 15),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
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

                          Row(
                            children: [
                              SizedBox(
                                  width: width * .2,
                                  height: height * .1,
                                  child: Lottie.asset('assets/lottie/RobotAi.json')),
                              Padding(
                                padding: EdgeInsets.only(top: height*.02, left: width*.02),
                                child: SizedBox(
                                  width: width*.65,
                                  child: SingleChildScrollView(
                                    child: GeminiResponseTypeView(
                                        builder: ((context, child, response, loading) {
                                          if (loading) {
                                            return Center(
                                              child: SizedBox(
                                                  width: width * .8,
                                                  height: height * .1,
                                                  child: Lottie.asset(
                                                      'assets/lottie/loading.json')),
                                            );
                                          }
                                          if (response != null) {
                                            return Text(
                                              response,
                                              maxLines: null,
                                              style: TextStyle(color: colorPrimary),
                                            );
                                          }
                                          return const SizedBox();
                                        })),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      )),
                  // Gap(height*0.2),
                  // if (!isKeyboard)
                  //   SizedBox(
                  //     height: height * .3,
                  //   ),
                  //
                ],
              ),
            )
          ],
        ));
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

  void _welcomeUser() {
    final promptInstruction =
        '**System Instructions:**'
        '* **Role:** Language Learning Assistant'
        '* **Personality:** Friendly, helpful, and encouraging'
        '* **Language:** ${_userLanguage?[0].lLanguage}'
        '* **Response Style:**'
        '* Use plain text without asterisks (***) using any other formatting that the user will understand.'
        '* Focus on clear and concise communication.'
        '* don\'t response to any prompt outside language learning just say:Hmm, that\'s not quite something I can tackle yet. How about we try some fun language learning exercises instead?'
        '* Prioritize providing relevant information and completing tasks.';

    String userConversation = '${promptInstruction}Hi';
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

  //Gemini Stream
  void _streamGenerativeContent() {
    final promptInstruction =
        '**System Instructions:**'
        '* **Role:** Language Learning Assistant'
        '* **Personality:** Friendly, helpful, and encouraging'
        '* **Language:** ${_userLanguage?[0].lLanguage}'
        '* **Response Style:**'
        '* Use plain text without asterisks (***) using any other formatting that the user will understand.'
        '* Focus on clear and concise communication.'
        '* don\'t response to any prompt outside language learning just say:Hmm, that\'s not quite something I can tackle yet. How about we try some fun language learning exercises instead?'
        '* Prioritize providing relevant information and completing tasks.';

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

}
