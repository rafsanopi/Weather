import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapLocation extends StatelessWidget {
  const MapLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 50.h,
      child: SizedBox(
        width: 241,
        height: 550,
        child: Stack(
          children: [
            Positioned(child: Image.asset("asset/map2.png")),
            Positioned(
                top: 5.h,
                child: SizedBox(
                    width: 170.w,
                    child: Opacity(
                      opacity: .8,
                      child: Image.asset(
                        "asset/cloud.png",
                      ),
                    ))),
            Positioned(
                bottom: 5.h,
                left: 15.w,
                child: SizedBox(
                    width: 190.w,
                    child: Opacity(
                        opacity: .7, child: Image.asset("asset/cloud.png")))),
          ],
        ),
      ),
    );
  }
}
