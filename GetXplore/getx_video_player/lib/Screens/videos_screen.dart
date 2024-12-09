import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_video_player/colors.dart' as color;
import 'package:video_player/video_player.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  List videoinfo = [];
  VideoPlayerController? _controller;
  bool _playArea = false;
  bool _isplaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      //if you put setState function when there is new info it updates the state
      setState(() {
        videoinfo = json.decode(value);
      });
    });
  }

  void initState() {
    super.initState();
    _initData();
  }

  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.9),
                    color.AppColor.gradientSecond.withOpacity(0.2)
                  ],
                  begin: const FractionalOffset(0.0, 0.5),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(
                color: color.AppColor.gradientFirst,
              ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 60.0, left: 25, right: 25),
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(child: Container()),
                            const Icon(
                              Icons.info,
                              size: 20,
                              color: Colors.black,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                              color: color.AppColor.homePageContainerTextBig,
                              fontWeight: FontWeight.w900,
                              fontSize: 25),
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                              color: color.AppColor.homePageContainerTextBig,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: color.AppColor.homePageIcon,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "60 mins",
                                    style: TextStyle(
                                        color: color.AppColor
                                            .homePageContainerTextSmall,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 25,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    color: color.AppColor.homePageIcon,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Islamabad, Pakistan",
                                    style: TextStyle(
                                        color: color.AppColor
                                            .homePageContainerTextSmall,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 25),
                          height: 60,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 25,
                                  )),
                              Expanded(child: Container()),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.info,
                                    color: Colors.black,
                                    size: 25,
                                  )),
                            ],
                          ),
                        ),
                        _playView(context),
                        SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.black,
                              inactiveTrackColor: Colors.black.withOpacity(0.1),
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 2.0,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 10),
                              thumbColor: Colors.black,
                              overlayColor: Colors.black.withAlpha(32),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.black,
                              inactiveTickMarkColor:
                                  Colors.black.withOpacity(0.1),
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.black,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Slider(
                                value: max(0, min(_progress * 100, 100)),
                                min: 0,
                                max: 100,
                                divisions: 100,
                                label: _position?.toString().split(".")[0],
                                onChanged: (value) {
                                  setState(() {
                                    _progress = value * 0.01;
                                  });
                                },
                                onChangeStart: (value) {
                                  _controller?.pause();
                                },
                              onChangeEnd: (value){
                                  final duration = _controller?.value.duration;
                                  if(duration != null){
                                    var newValue = max(0, min(value, 99)) * 0.01;
                                    var millis = (duration.inMilliseconds * newValue).toInt();
                                    _controller?.seekTo(Duration(milliseconds: millis));
                                    _controller?.play();
                                  }
                              },
                                )),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Circuit 1: Legs Toning",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                        Expanded(child: Container()),
                        const Icon(
                          Icons.loop,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "3 sets",
                          style: TextStyle(
                              fontSize: 16,
                              color: color.AppColor.homePageContainerTextSmall),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: _listView())
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) >
        0; // if volume exists we will use a volume  if the volume doesnt exist thwn we will use 0
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60); //  22 ~/ 7 = 3
    final secs = convertTwo(remained % 60); // 22 % 7 = 1

    //Play&Pause Video Container
    return Container(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: IconButton(
              onPressed: () async {
                if (noMute) {
                  _controller?.setVolume(0);
                } else {
                  _controller?.setVolume(1);
                }

                setState(() {});
              },
              icon: Icon(
                noMute ? Icons.volume_up : Icons.volume_off,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          SizedBox(
            width: 60,
          ),
          IconButton(
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index >= 0 && videoinfo.length >= 0) {
                  _onTapVideo(index);
                } else {
                  Get.snackbar(
                    "Alert",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.black,
                    ),
                    backgroundColor: color.AppColor.gradientFirst,
                    messageText: Text(
                      "No Videos ahead!",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.fast_rewind,
                size: 33,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () async {
                if (_isplaying) {
                  setState(() {
                    _isplaying = false;
                  });
                  _controller?.pause();
                } else {
                  setState(() {
                    _isplaying = true;
                  });
                  _controller?.play();
                }
              },
              icon: Icon(
                _isplaying ? Icons.pause : Icons.play_arrow,
                size: 36,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () async {
                final index = _isPlayingIndex + 1;
                if (index <= videoinfo.length - 1) {
                  // total video are 3 and there indexes are 0-2 so that why videoinfo.length-1
                  _onTapVideo(index);
                } else {
                  Get.snackbar(
                    "Alert",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.black,
                    ),
                    backgroundColor: color.AppColor.gradientFirst,
                    messageText: Text(
                      "You have finished watching all the videos. Congrats!",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.fast_forward,
                size: 33,
                color: Colors.black,
              )),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              "$mins:$secs",
              style: TextStyle(color: Colors.black, shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.1),
                  blurRadius: 4.0,
                  color: Colors.grey,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }

    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onUpdateControllerTime > 0) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      print("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      print("controller can not be initialized");
      return;
    }
    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isplaying = playing;
  }

  _onTapVideo(int index) async {
    // to get the video we use this index
    final controller = VideoPlayerController.networkUrl(
        Uri.parse(videoinfo[index]["videoUrl"]));
    final old = _controller;
    _controller = controller;

    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(
            _onControllerUpdate); //when you attach a function to its listner the function keeps calling it again and again
        controller.play();
        setState(() {});
      });
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          )));
    }
  }

  _listView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        itemCount: videoinfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _onTapVideo(index);
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 120,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(videoinfo[index]["thumbnail"])),
                  color: Colors.cyan.withOpacity(0.9),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoinfo[index]["title"],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color.AppColor.homePageContainerTextBig),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    videoinfo[index]["time"],
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: color.AppColor.homePageContainerTextSmall),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "15s rest",
                  style: TextStyle(
                      color: color.AppColor.gradientFirst.withOpacity(0.9),
                      fontWeight: FontWeight.bold),
                )),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: color.AppColor.gradientFirst,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: color.AppColor.homePageBackground,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
