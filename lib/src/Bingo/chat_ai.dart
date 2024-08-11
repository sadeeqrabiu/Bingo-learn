import 'package:bingolearn/src/Bingo/chat_state.dart';
import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../tools/colors.dart';

class ChatAI extends StatefulWidget {
  const ChatAI({
    Key? key,
    required this.language,
  }) : super(key: key);

  final String? language;


  @override
  State<ChatAI> createState() => _ChatAIState();
}

class _ChatAIState extends State<ChatAI> {
  //Instance of Gemini
  final gemini = Gemini.instance;

  bool introductionSent = false;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0",);

  ChatUser geminiUser = ChatUser(id: "1", );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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
              Text(
                'Conversation',
                style: TextStyle(
                    color: colorPrimary,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Gap(height * .02),
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
              //     (route) => false);
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

    if(!introductionSent){
      introductionSent = true;
      setState(() {
        messages = [chatMessage, ...messages];
      });
      final promptInstruction =
          '**System Instructions:**'
          '* You are a Language Learning Assistant for Bingo Learn.'
          '* Be friendly, helpful, and encouraging.'
          '**Prompts:**'
          '* When the user starts a first session:'
          '>Hi there!   Welcome to Bingo Learn. How can I help you practice ${widget.language} today?';


      //Gemini
      try {
        String question = promptInstruction + chatMessage.text;
        gemini.streamGenerateContent(
          question,
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

    }else{
      setState(() {
        messages = [chatMessage, ...messages];
      });

      final promptInstruction =
    '**System Instructions:**'
    '* **Role:** Language Learning Assistant'
    '* **Personality:** Friendly, helpful, and encouraging'
    '* **Language:** ${widget.language}'
    '* **Response Style:**'
    '* Use plain text without asterisks (***) using any other formatting that the user will understand.'
    '* Focus on clear and concise communication.'
    '* don\'t response to any prompt outside language learning just say:Hmm, that\'s not quite something I can tackle yet. How about we try some fun language learning exercises instead?'
    '* Prioritize providing relevant information and completing tasks.';


      //Gemini
      try {
        String question = promptInstruction + chatMessage.text;
        debugPrint(widget.language);
        gemini.streamGenerateContent(
          question,
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
}
