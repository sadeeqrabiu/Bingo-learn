import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gap/gap.dart';

import '../dashboard/home_screen.dart';
import '../tools/colors.dart';


class TranslateAi extends StatefulWidget {

  const TranslateAi({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String? language;

  @override
  State<TranslateAi> createState() => _TranslateAiState();
}

class _TranslateAiState extends State<TranslateAi> {
  //Instance of Gemini
  final gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0",);

  ChatUser geminiUser = ChatUser(id: "1",  );

  @override
  Widget build(BuildContext context) {
    //Media Query
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: colorPrimary,
        appBar: AppBar(
          backgroundColor: colorMain,
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
              Gap(height * .005),
              Text('Translation',style: TextStyle(color: colorPrimary, fontSize: 15),)
              // Container(
              //   height: height * .03,
              //   width: width * .2,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(100),
              //       color: colorBlue.withOpacity(0.35)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: width * 0.02,
              //         child: Container(
              //           height: height * 0.05,
              //           decoration: BoxDecoration(
              //             color: colorGreen,
              //             shape: BoxShape.circle,
              //           ),
              //         ),
              //       ),
              //       Text(
              //         ' Online',
              //         style: TextStyle(color: colorPrimary, fontSize: 10),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
          toolbarHeight: height * 0.09,
          elevation: 0,
          leading: IconButton(
            icon: Icon(EvaIcons.arrowIosBackOutline, color: colorPrimary), // Set color
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()),
              //         (route) => false);
            }, // Handle back navigation
          ),
          // automaticallyImplyLeading: false,
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
            // Padding(
            //     padding: EdgeInsets.only(left: width * .05, right: width * .05),
            //     child: Column(
            //       children: [
            //         //Header
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             GestureDetector(
            //               child: Icon(
            //                 EvaIcons.close,
            //                 color: colorPrimary,
            //               ),
            //               onTap: () {
            //                 Navigator.pushAndRemoveUntil(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => HomeScreen()),
            //                         (route) => false);
            //               },
            //             ),
            //             Text(
            //               'Bingo.AI',
            //               style: TextStyle(
            //                   color: colorPrimary, fontWeight: FontWeight.bold),
            //             ),
            //             SizedBox(
            //               width: width * .05,
            //             )
            //           ],
            //         ),
            //         Gap(height * .02),
            //         Container(
            //           height: height * .035,
            //           width: width * .2,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(100),
            //               color: colorBlue.withOpacity(0.35)),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               SizedBox(
            //                 width: width * 0.02,
            //                 child: Container(
            //                   height: height * 0.05,
            //                   decoration: BoxDecoration(
            //                     color: colorGreen,
            //                     shape: BoxShape.circle,
            //                   ),
            //                 ),
            //               ),
            //               Text(
            //                 ' Online',
            //                 style: TextStyle(color: colorPrimary),
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     )),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: _buildUI(),
            ),
          ],
        ));
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
      inputOptions: const InputOptions(
        alwaysShowSend: true,
      ),
      messageOptions:
      MessageOptions(
      currentUserContainerColor: Colors.transparent,
      showOtherUsersAvatar: false,
      containerColor: Colors.transparent,
      textColor: colorPrimary
      ),

    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      debugPrint(chatMessage.toString());
      messages = [chatMessage, ...messages];
    });

    //Gemini
    try {
      final promptInstruction =
          '**System Instructions:**'
          '* **Role:** Language translation'
          '* **Language:** ${widget.language}'
          '* **Response Style:**'
          '* Use plain text without asterisks (***) using any other formatting that the user will understand.'
          '* what\'s ${chatMessage.text} in ${widget.language}';

       debugPrint(promptInstruction);

      // gemini.streamGenerateContent(translation,generationConfig: GenerationConfig(
      //   temperature: 1,
      // ) ).listen((event){});
      gemini.streamGenerateContent(
          promptInstruction,
          generationConfig:
          GenerationConfig(temperature: 1, maxOutputTokens: 100),
      ).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
              "", (previous, current) => "$previous ${current.text}") ??
              "";

          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
              "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
