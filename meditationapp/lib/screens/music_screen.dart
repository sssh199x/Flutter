import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditationapp/animations/animations.dart';
import 'package:meditationapp/widgets/wave_clipper.dart';

class MusicScreen extends StatelessWidget {
  MusicScreen({super.key});

  final List songNamesList = [
    'Behaviour of the mind',
    'Your inner voice',
    'Embrace your Emotions',
    'Live your life',
    'Talk less observe more'
  ];
  final List playTimeList = ['2:34', '5:55', '2:04', '1:00', '10:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 170.r),
              child: const Icon(Icons.message_outlined),
            )
          ],
        ),
        body: Stack(
          children: [
            // Image clipping with ClipPath and Blur with BackdropFilter
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ScaleAnimation(
                begin: 0.0,
                child: ClipPath(
                  clipper: WaveClip(),
                  child: Container(
                    width: double.infinity,
                    height: ScreenUtil().screenHeight * 0.6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/tree.jpeg'),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Main body starting from Killing Anxiety
            Positioned(
                top: 10.h,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Killing Anxiety',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.r,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Calm your anxieties,reduce tension and\n               increase body awarnesss.',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.r),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SlideAnimation(
                              duration: const Duration(seconds: 2),
                              child: Container(
                                width: 180.r,
                                height: 180.r,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.greenAccent
                                              .withOpacity(0.8),
                                          blurRadius: 25,
                                          offset: const Offset(0, 5),
                                          spreadRadius: 10)
                                    ],
                                    borderRadius: BorderRadius.circular(50),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/yoga.jpeg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            const FadeAnimation(
                              duration: Duration(seconds: 3),
                              child: Text('by Tory Lane',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            Divider(
                              thickness: 0.75.r,
                              indent: ScreenUtil().screenWidth * 0.25,
                              endIndent: ScreenUtil().screenWidth * 0.25,
                              color: Colors.teal,
                            ),
                            SlideAnimation(
                              duration: const Duration(seconds: 3),
                              begin: const Offset(0, 100),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                height: ScreenUtil().screenHeight * 0.223,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40.0),
                                      child: FadeAnimation(
                                        duration: Duration(seconds: 3),
                                        child: Card(
                                          surfaceTintColor: Colors.teal,
                                          color: Colors.greenAccent
                                              .withOpacity(0.3),
                                          shape: const OutlineInputBorder(),
                                          child: ListTile(
                                            autofocus: true,
                                            leading: (index == 0)
                                                ? const Icon(Icons.play_arrow)
                                                : const Icon(
                                                    Icons.lock_rounded),
                                            title: Text(songNamesList[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: index == 0
                                                        ? Colors.black
                                                        : Colors.white)),
                                            trailing: Text(playTimeList[index],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: index == 0
                                                        ? Colors.black
                                                        : Colors.white)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: songNamesList.length,
                                ),
                              ),
                            )
                          ]),
                    )
                  ],
                )),

            //BottomBar
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SlideAnimation(
                  begin: const Offset(-200, 0),
                  duration: const Duration(seconds: 2),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.h),
                    height: 90.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.greenAccent.withOpacity(0.2)
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2:30',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 12.r,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Rainforest-Relaxing',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.r,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '- 0:50',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 12.r),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: 53.r,
              left: 0,
              right: 0,
              child: FadeAnimation(
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 2),
                child: Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.tealAccent.withOpacity(0.8)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      size: 30.r,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
