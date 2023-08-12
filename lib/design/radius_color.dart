import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadiusColors extends StatelessWidget {
  const RadiusColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -97.57.w,
      top: 265.h,
      child: SizedBox(
        width: 809.15,
        height: 809.15,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 809.15,
                height: 809.15,
                decoration: ShapeDecoration(
                  color: const Color(0x1640D153),
                  shape: OvalBorder(
                    side: BorderSide(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 95.37,
              top: 95.37,
              child: Container(
                width: 615.32,
                height: 615.32,
                decoration: ShapeDecoration(
                  color: const Color(0x1640D153),
                  shape: OvalBorder(
                    side: BorderSide(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 172.29,
              top: 175.37,
              child: Container(
                width: 458.41,
                height: 458.41,
                decoration: ShapeDecoration(
                  color: const Color(0x1640D153),
                  shape: OvalBorder(
                    side: BorderSide(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 249.20,
              top: 249.20,
              child: Container(
                width: 307.66,
                height: 307.66,
                decoration: ShapeDecoration(
                  color: const Color(0x1640D153),
                  shape: OvalBorder(
                    side: BorderSide(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
