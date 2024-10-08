import 'package:bingolearn/src/Bingo/bingo_start.dart';
import 'package:bingolearn/src/Notification/notification_screen.dart';
import 'package:bingolearn/src/User_profile%20/profile.dart';
import 'package:bingolearn/src/game/game_start.dart';
import 'package:bingolearn/src/lesson/lesson_dashboard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../core/api_section/api_service.dart';
import '../../core/local_store/shared_service.dart';
import '../../core/models/user/usesr_data.dart';
import '../tools/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final double totalTime = 15.0; // 15 minutes as the total time
  double timeSpent = 10.0; // Example: 10 minutes spent

  // var time = 0.3;

  @override
  void initState() {
    super.initState();
    // checkTime();
    // fetchData();
    getUser();
  }

  //getting user data
  List<UserDataListModel>? _userData;


  @override
  Widget build(BuildContext context) {
    //Media Query

    //Timer
    double percent = timeSpent / totalTime;

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
                gradient: LinearGradient(
                    colors: [Color(0xFF11212D), Color(0xFF06141B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),


         //
            Padding(
              padding:  EdgeInsets.only(left: width*.05, right: width*.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: SizedBox(
                          width: width * 0.1,
                          child: Container(
                            height: height * 0.065,
                            decoration: BoxDecoration(
                              color: colorSecondary,
                              shape: BoxShape.circle,
                              image: _userData != null && _userData!.isNotEmpty ? DecorationImage(
                                  image: NetworkImage('${_userData?[0].learningFlag}'),
                                  fit: BoxFit.cover) : null
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Profile(flag: '${_userData?[0].learningFlag}', userName: '${_userData?[0].firstName} ${_userData?[0].lastName}');
                              }));
                        },
                      ),
                     Gap(width*.0),
                     Icon(EvaIcons.arrowIosDownward, color: colorPrimary,),
                      Gap(width*.15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gap(width*.17),
                          SizedBox(
                            height: height * 0.03,
                            child: SvgPicture.asset(
                              'assets/icons/fireIcon.svg',
                            ),
                          ),
                          Gap(width*.01),
                           Text('0', style: TextStyle(color: colorPrimary),),
                          Gap(width*.05),
                          SizedBox(
                            height: height * 0.03,
                            child: SvgPicture.asset(
                              'assets/icons/heartIcon.svg',
                            ),
                          ),
                          Gap(width*.01),
                          Text('5', style: TextStyle(color: colorPrimary),),

                          Gap(width*.1),
                          GestureDetector(
                              child: Icon(EvaIcons.bellOutline, color: colorPrimary.withOpacity(0.7),),
                            onTap: (){
                              // SharedService.logout(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const NotificationScreen();
                                  }));
                            },
                          )
                        ],
                      ),

                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                     Container(
                          height: height*.15,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorGrey.withOpacity(0.2)
                          ),
                       child: Padding(
                         padding: EdgeInsets.only(left: width*.02,),
                         child:  Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Padding(
                               padding: EdgeInsets.only(left: width*.02),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text('Learning Goal', style: TextStyle(fontSize: 18, color: colorPrimary, fontWeight: FontWeight.bold),),
                                   Row(
                                     children: [
                                       Text('Today/ ', style: TextStyle(fontSize: 18, color: colorPrimary, fontWeight: FontWeight.bold),),
                                       Text('${_userData?[0].learningGoal}min', style: TextStyle(fontSize: 15, color: colorYellow),),
                                     ],
                                   ),
                                 ],
                               ),
                             ),

//Percentage indicator
                             LinearPercentIndicator(
                               width: width*.45,
                               lineHeight: height*.01,
                               percent: percent,
                               backgroundColor: colorPrimary,
                               progressColor: colorYellow,
                               barRadius: const Radius.circular(20),

                             )
                           ],
                         ),
                       ),
                        ),


                      //DashBoard Card
                      Container(
                        margin: EdgeInsets.only(right: width*0.04, bottom: height*.025),
                        height: height * 0.2,
                        child: SvgPicture.asset(
                          'assets/svgs/PersonIllustration.svg',
                        ),
                      ),
                    ],
                  ),
                  Gap(height*.00),
                  //Dashboard Cards
                  Padding(
                    padding: EdgeInsets.only(left: width*.08, right: width*.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: height*.22,
                            width: width*.34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorBlue.withOpacity(0.8)
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: width*.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.13,
                                      child: Container(
                                        margin: EdgeInsets.only(top: height*.01),
                                        height: height * 0.065,
                                        decoration: BoxDecoration(
                                          color: colorPrimary,
                                          shape: BoxShape.circle,
                                          // image: DecorationImage(
                                          //     image: NetworkImage(profileModel.profileImg),
                                          //     fit: BoxFit.cover),
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            height: height * 0.03,
                                            child: SvgPicture.asset(
                                              'assets/icons/aiIcon.svg',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(height*.03),
                                    Text('Learn With', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: colorPrimary),),
                                    Text('Bingo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: colorPrimary),),
                                    Text('Let’s try it now!', style: TextStyle(fontSize: 12, color: colorPrimary),)


                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return const BingoStart();
                                }));
                          },
                        ),
                        Gap(width*.0),
                        GestureDetector(
                          child: Container(
                            height: height*.22,
                            width: width*.34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorYellow.withOpacity(0.6)
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * 0.13,
                                    child: Container(
                                      margin: EdgeInsets.only(top: height*.01),
                                      height: height * 0.065,
                                      decoration: BoxDecoration(
                                        color: colorPrimary,
                                        shape: BoxShape.circle,
                                        // image: DecorationImage(
                                        //     image: NetworkImage(profileModel.profileImg),
                                        //     fit: BoxFit.cover),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          height: height * 0.03,
                                          child: SvgPicture.asset(
                                            'assets/icons/lessonIcon.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(height*.03),
                                  Text('Continue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: colorPrimary),),
                                  Text('lesson', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: colorPrimary),),
                                  Text('Improve your learning!', style: TextStyle(fontSize: 10, color: colorPrimary),)
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return  LessonDashboard(language: _userData?[0].lLanguage, flag: _userData?[0].learningFlag, min: _userData?[0].learningGoal,);
                                }));
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(height*.02),
                  Padding(
                    padding: EdgeInsets.only(left: width*.08, right: width*.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: height*.22,
                            width: width*.34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorBlueSecond.withOpacity(0.8)
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * 0.13,
                                    child: Container(
                                      margin: EdgeInsets.only(top: height*.01),
                                      height: height * 0.065,
                                      decoration: BoxDecoration(
                                        color: colorPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          height: height * 0.03,
                                          child: SvgPicture.asset(
                                            'assets/icons/gameIcon.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(height*.07),
                                  Text('Game', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: colorPrimary),),
                                  Text('Learning make fun!', style: TextStyle(fontSize: 12, color: colorPrimary),)

                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return GameStart(language: _userData?[0].lLanguage,);
                                }));
                          },
                        ),

                        SizedBox(
                          height: height*.22,
                          width: width*.34,

                        ),
                      ],
                    ),
                  ),

                  Gap(height*.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height*.065,
                        width: width*.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorGrey.withOpacity(0.2)

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.03,
                              child: SvgPicture.asset(
                                'assets/icons/homeIcon.svg',
                              ),
                            ),
                            Gap(width*.1),
                            GestureDetector(
                              child: SizedBox(
                                width: width * 0.10,
                                child: Container(
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                    color: colorPrimary,
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/Avatar.png'),)
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return  Profile(flag: '${_userData?[0].learningFlag}', userName: '${_userData?[0].firstName} ${_userData?[0].lastName}',);
                                    }));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  //Sending a request to user Data from ApI
  void fetchData() async {
    ApiService.getUserData().then((response) => {
      getUser(),
    });
  }

  //Get user data and update App state
  Future<void> getUser() async {
    try {
      final userData = await ApiService.getUserData();
      setState(() {
        _userData = userData;
      });
    } on Exception catch (error) {
      // Handle API errors here, potentially including redirecting to LandingScreen
      SharedService.logout(context);
      debugPrint('Failed to fetch user data: $error');
    }
  }

}
