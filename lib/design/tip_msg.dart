import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/service/api.dart';
import 'package:weather/service/json_model.dart';

class TipMessage extends GetView<ServiceController> {
  const TipMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 400.h,
      child: Container(
        padding: EdgeInsets.only(left: 10.w),
        width: 200.w,
        height: 106,
        child: Row(
          children: [
            Container(
              width: 3,
              height: 60.h,
              decoration: const BoxDecoration(color: Color(0xFF64C854)),
            ),
            SizedBox(
              width: 10.w,
            ),
            FutureBuilder<WeatherData>(
                future: controller.api(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show a loading indicator while waiting for data
                  } else if (snapshot.hasError) {
                    return Text(
                        "Error: ${snapshot.error}"); // Show an error message if data fetch fails
                  } else if (!snapshot.hasData) {
                    return const Text(
                        "No data available"); // Handle case where no data is available
                  }

                  WeatherData weatherData = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tip',
                        style: TextStyle(
                          color: Color(0xFF64C854),
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.80,
                        ),
                      ),
                      SizedBox(
                        width: 164,
                        child: Text(
                          weatherData.days[0].description,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.56,
                          ),
                        ),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
