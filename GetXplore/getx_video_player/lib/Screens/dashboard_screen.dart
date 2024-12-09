import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_video_player/Screens/videos_screen.dart';
import 'package:getx_video_player/colors.dart' as color;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

List info = [];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
    setState(() {
      info = json.decode(value);
    });
    });
  }
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  color: color.AppColor.homePageIcon,
                  size: 18,
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.calendar_month,
                  color: color.AppColor.homePageIcon,
                  size: 18,
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color.AppColor.homePageIcon,
                  size: 18,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Your Program",
                  style: TextStyle(
                      color: color.AppColor.homePageSubtitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                      color: color.AppColor.homePageDetail.withOpacity(0.9),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(() => VideosScreen());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: color.AppColor.homePageIcon,
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond.withOpacity(0.1)
                  ]),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      color: color.AppColor.gradientSecond.withOpacity(0.2),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next workout",
                    style: TextStyle(
                        color: color.AppColor.homePageContainerTextSmall,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                        color: color.AppColor.homePageContainerTextBig,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                        color: color.AppColor.homePageContainerTextBig,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        color: color.AppColor.homePageIcon,
                        size: 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "60 mins",
                        style: TextStyle(
                            color: color.AppColor.homePageContainerTextSmall,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 6),
                                blurRadius: 10,
                                color: Colors.black54.withOpacity(0.4),
                              )
                            ]),
                        child: Icon(
                          Icons.play_circle,
                          color: Colors.black,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: Stack(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-1, -3),
                            blurRadius: 40,
                            color:
                                color.AppColor.gradientFirst.withOpacity(0.4),
                          )
                        ],
                        image: const DecorationImage(
                          image: AssetImage(
                            "Assets/girl_avatar.png",
                          ),
                          alignment: Alignment.bottomRight,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are doing great...",
                            style: TextStyle(
                              color: color.AppColor.gradientFirst,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Keep it up,",
                            style: TextStyle(
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          ),
                          Text(
                            "Stick to your plan",
                            style: TextStyle(
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 25,
            ),
            Text(
              "Area of focus",
              style: TextStyle(
                color: color.AppColor.homePageTitle,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                 child : ListView.builder(
                      itemCount: (info.length.toDouble()/2).toInt(),
                      itemBuilder: (_, i) {
                        int a = 2*i;  //0
                        int b = 2*i +1;  //0+1=1
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 6, bottom: 30, top: 10),
                              height: 170,
                              width: (MediaQuery.of(context).size.width - 90)/2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      info[a]['img'],
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.2),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.2),
                                    )
                                  ]),
                              child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                      child: Text(
                                info[a]["title"],
                                style: TextStyle(
                                  color: color.AppColor.homePageDetail,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20
                                ),
                              ))),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30, bottom: 30, top: 10),
                              height: 170,
                              width: (MediaQuery.of(context).size.width - 90)/2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      info[b]['img'],
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.2),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.2),
                                    )
                                  ]),
                              child: Center(
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        info[b]["title"],
                                        style: TextStyle(
                                            color: color.AppColor.homePageDetail,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20
                                        ),
                                      ))),
                            ),
                          ],
                        );
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
