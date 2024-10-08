import 'dart:async';
import 'dart:math';

import 'package:bingolearn/core/models/game/words_model.dart';
import 'package:bingolearn/core/notifiers%20/ui_state_notifier.dart';
import 'package:bingolearn/core/providers/game_provider.dart';
import 'package:bingolearn/src/game/game_complete.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../core/api_section/api_service.dart';
import '../tools/colors.dart';

class FlashCard extends ConsumerStatefulWidget {
  const FlashCard({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String? language;

  @override
  ConsumerState<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends ConsumerState<FlashCard> {
  final gemini = Gemini.instance;
  //current Card
  int currentCard = 10;
  //List of words
  List<WordsModel>? _words;
  bool introductionSent = false;
  var isLoaded = false;

  int correct = 0;
  int inCorrect = 0;
  //notify that the user have reach max card
  int flashCardCounter = 0;

  int heartCounter = 5;

  //time display
  var timeDisplay = false;
  //Correct +
  addCorrect() {
    correct = correct++;
  }
//InCorrect +
  addInCorrect() {
    inCorrect = inCorrect++;
  }
//Cards Number +-
  addNumberOfCards() {
    flashCardCounter = flashCardCounter++;
  }


//List of colors for the cards
  List colorList = [
    colorBlue,
    colorYellow,
    colorMain,
    colorOrange,
    colorGreen,
    colorBlue,
    colorYellow,
    colorMain,
    colorRed,
    colorGreen,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWords();
  }

  TextEditingController randomWordsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //provider
    final uiState = ref.watch(GameProvider.uiStateNotifier);

    String strDigits(int n) => n.toString().padLeft(2, '0');
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Icon(
                              EvaIcons.close,
                              color: colorPrimary,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            'Flash Card',
                            style: TextStyle(
                                color: colorPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * .07,
                          )
                        ],
                      ),

                      Gap(height * .04),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * .06, right: width * .06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'cards: ',
                                  style: TextStyle(
                                      color: colorPrimary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${currentCard.toString()}/10',
                                  style: TextStyle(color: colorPrimary),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  child: SvgPicture.asset(
                                    'assets/icons/heartIcon.svg',
                                  ),
                                ),
                                Gap(width*.01),
                                Text(heartCounter.toString(), style: TextStyle(color: colorPrimary),),
                              ],
                            )
                          ],
                        ),
                      ),

                      Gap(height * .04),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                style: TextStyle(color: colorPrimary),
                              );
                            }
                            return const SizedBox();
                          })),
                        ),
                      ),
                      Gap(height * .0),

                      //Cards section
                      if (isLoaded)
                        Container(
                          height: height * 0.35,
                          width: width,
                          margin: const EdgeInsets.symmetric(horizontal: 75),
                          child: CardSwiper(
                              cardBuilder: (context, index, y, x) {
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: GestureDetector(
                                      child: Container(
                                        height: height * 0.3,
                                        width: width * 1.5,
                                        color: colorList[index],
                                        child: Center(
                                          child: Text(
                                            _words![index].word,
                                            style: TextStyle(
                                                color: colorPrimary,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        // debugPrint(_words![index].word);
                                        if (_words![index].word ==
                                            randomWordsController.text) {
                                          debugPrint('correct');
                                          // flashCardCounter++;
                                          correct++;
                                          // addNumberOfCards();
                                          // addCorrect();
                                          debugPrint(
                                              flashCardCounter.toString());
                                          debugPrint(correct.toString());
                                          // startTimer();
                                          setState(() {
                                            timeDisplay = true;
                                          });
                                          checkCards();
                                          _cardNotifier(uiState);
                                        } else {
                                          debugPrint(_words![index].word);
                                          debugPrint('incorrect');
                                          inCorrect++;
                                          heartCounter--;
                                          // startTimer();
                                          setState(() {
                                            timeDisplay = true;
                                          });
                                          checkCards();
                                          _cardNotifier(uiState);
                                        }
                                      },
                                    ));
                              },
                              cardsCount: 10),
                        ),
                    ],
                  ),
                ))
          ],
        ));
  }

  //card Notifier
  void _cardNotifier(UIState uiState) {
    switch (uiState) {
      case UIState.notStarted:
        return _streamGenerativeContent();
      case UIState.correct:
        // TODO: Handle this case.
        return debugPrint('Correct');
      case UIState.incorrect:
        // TODO: Handle this case.
        return debugPrint('inCorrect');
        break;
    }
  }


  checkCards() {
    if (flashCardCounter == 10) {
      debugPrint(flashCardCounter.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return GameComplete(
            incorrect: inCorrect.toString(), correct: correct.toString());
      }));
    } else {
      flashCardCounter++;
      setState(() {
        currentCard--;
      });

    }
  }

  void _streamGenerativeContent() {
    setState(() {
      timeDisplay = true;
    });
    //this is an instruction for user first prompt
    if (introductionSent) {
      final randomIndex = _words![Random().nextInt(_words!.length)];
      randomWordsController.text = randomIndex.word;
      debugPrint(randomWordsController.text);
      final prompt = '**System Instructions:**'
          '* **Response Style:**'
          '* Make a short sentence with ${randomWordsController.text} without using ${randomWordsController.text}'
          '* Show response in English And ${widget.language} and be concise.';

      //Gemini Stream
      gemini.streamGenerateContent(prompt,
          generationConfig:
              GenerationConfig(temperature: 1, maxOutputTokens: 200),
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
    } else {
      final randomIndex = _words![Random().nextInt(_words!.length)];
      randomWordsController.text = randomIndex.word;
      debugPrint(randomWordsController.text);
      final prompt =
          'Make a short sentence with ${randomWordsController.text} without using ${randomWordsController.text} in ${widget.language} and english and be concise.';

      debugPrint(prompt);
      gemini.streamGenerateContent(prompt,
          generationConfig:
              GenerationConfig(temperature: 1, maxOutputTokens: 200),
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

//Getting words from Api
  Future<void> getWords() async {
    _words = await ApiService.getWords();
    setState(() {
      isLoaded = true;
    });
    _streamGenerativeContent();
  }
}
