import 'package:bingolearn/core/api_section/api_service.dart';
import 'package:bingolearn/core/models/languages/languages_model.dart';
import 'package:bingolearn/src/Languages/language_verify.dart';
import 'package:bingolearn/src/Languages/languages_card.dart';
import 'package:bingolearn/src/dashboard/home_screen.dart';
import 'package:bingolearn/src/register_section/learning_goal.dart';
import 'package:bingolearn/src/shimmer/languages_loader.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tools/colors.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({
    Key? key,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? email;

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  //list from the APi
  List<LanguagesModel>? _languages;

  // Loading;
  bool _isloading = true;

  @override
  void initState() {
    getLanguages();
    super.initState();
  }

  TextEditingController languageController = TextEditingController();
  TextEditingController flagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //MediaQuery
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        toolbarHeight: height * 0.02,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(
            top: height * 0.01, right: width * 0.07, left: width * 0.07),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  height: height * .15,
                  child: SvgPicture.asset(
                    'assets/svgs/Bingo.svg',
                  ),
                ),
                SizedBox(
                  width: width * .02,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Hi, ',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          widget.firstName!,
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    const Text('Welcome to bengo-Learn 🎊')
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * .03,
            ),
            const Row(
              children: [
                Text(
                  'Choose your language',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  'A new and existing way to learn',
                ),
              ],
            ),
            SizedBox(
              height: height * .04,
            ),
            const Row(
              children: [
                Text(
                  'I speak',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'English',
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    Container(
                      height: height * .04,
                      width: width * .17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorMain,
                      ),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              color: colorPrimary, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Divider(
              thickness: 2,
              color: colorGrey,
            ),
            SizedBox(
              height: height * .02,
            ),
            const Row(
              children: [
                Text(
                  'Which language would you like to learn?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
            Expanded(
              child: _isloading
                  ? ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const LanguagesLoader();
                      })
                  : ListView.builder(
                      itemCount: _languages?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: LanguagesCard(
                            languageName: _languages![index].language,
                            flag: _languages![index].flag,
                          ),
                          onTap: () {
                            debugPrint('verify Email : ${widget.firstName!}${widget.middleName!}${widget.lastName!}${widget.email!}');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LearningGoal(
                                language: _languages![index].language,
                                flag: _languages![index].flag,
                                firstName: widget.firstName,
                                middleName: widget.middleName,
                                lastName: widget.lastName,
                                email: widget.email,
                              );
                            }));
                            // APIServices.getLabDetails();
                            //     .then((response) => {
                            //   if(response != null){
                            //
                            //   }
                            // });
                            // Navigator.push(context,
                          },
                        );
                      },
                    ),
            ),
            SizedBox(height: height * 0),
            // GestureDetector(
            //   child: Container(
            //     height: height * 0.06,
            //     margin: EdgeInsets.only(
            //       left: width * 0.05,
            //       right: width * 0.05,
            //     ),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: colorMain),
            //     child: Center(
            //       child: Text(
            //         'Continue',
            //         style: TextStyle(color: colorPrimary),
            //       ),
            //     ),
            //   ),
            //   onTap: (){
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) {
            //           return const LearningGoal();
            //         }));
            //   },
            //
            // ),
          ],
        ),
      )),
    );
  }

  Future<void> getLanguages() async {
    _languages = await ApiService.getLanguages();
    setState(() {
      _isloading = false;
    });
  }
}
