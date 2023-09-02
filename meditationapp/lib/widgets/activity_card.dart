import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditationapp/screens/music_screen.dart';
import 'package:meditationapp/widgets/bouncy_page_route.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageasset;
  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageasset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageasset),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, BouncyPageRoute(widget: MusicScreen())
              // PageRouteBuilder(
              //   transitionDuration: Duration(seconds: 1),
              //   transitionsBuilder:
              //       (context, animation, secondaryAnimation, child) {
              //     animation = CurvedAnimation(
              //         parent: animation, curve: Curves.bounceOut);
              //     return ScaleTransition(
              //       alignment: Alignment.center,
              //       filterQuality: FilterQuality.high,
              //       scale: animation,
              //       child: child,
              //     );
              //   },
              //   pageBuilder: (context, animation, secondaryAnimation) {
              //     return MusicScreen();
              //   },
              // )
              );
        },
        child: Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.r,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.r,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
