import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditationapp/animations/animations.dart';
import 'package:meditationapp/widgets/circle_buttons.dart';
import '../widgets/activity_card.dart';
import '../widgets/wave_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/desert.jpeg'), context);
    precacheImage(const AssetImage('assets/images/sky.jpeg'), context);
    precacheImage(const AssetImage('assets/images/ocean.jpeg'), context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SlideAnimation(
                begin: Offset(0, 100),
                child: FadeAnimation(
                  duration: Duration(seconds: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleButton(
                        isSelected: false,
                        iconName: Icons.center_focus_strong,
                        buttonDescription: 'Focus',
                      ),
                      CircleButton(
                        isSelected: true,
                        iconName: Icons.music_note,
                        buttonDescription: 'Relax',
                      ),
                      CircleButton(
                        isSelected: false,
                        iconName: Icons.dark_mode,
                        buttonDescription: 'Sleep',
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            top: ScreenUtil().screenHeight * 0.506,
            left: 0,
            child: ScaleAnimation(
              duration: const Duration(seconds: 3),
              begin: 0.4,
              intervalEnd: 0.8,
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                    title: 'Sensations',
                    subtitle: 'Feel the moments',
                    imageasset: 'assets/images/ocean.jpeg'),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().screenHeight * 0.264,
            left: 0,
            child: ScaleAnimation(
              duration: const Duration(seconds: 3),
              begin: 0.4,
              intervalEnd: 0.8,
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                    title: 'Daydream',
                    subtitle: 'go beyond theForm',
                    imageasset: 'assets/images/sky.jpeg'),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: ScaleAnimation(
              duration: const Duration(seconds: 3),
              begin: 0.4,
              intervalEnd: 0.8,
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                    title: 'Meditation',
                    subtitle: 'discover happiness',
                    imageasset: 'assets/images/desert.jpeg'),
              ),
            ),
          ),
          //APPBAR...
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  color: Colors.white.withOpacity(0.1),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.queue_music,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ))
                      ]),
                ),
              )),
          Positioned(
            top: 50.h,
            left: 155.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/user.jpeg',
                  width: 60.r,
                  height: 60.r,
                )),
          )
        ],
      ),
    );
  }
}
