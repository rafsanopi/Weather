import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/service/api.dart';
import 'package:weather/service/json_model.dart';

class SunUpdate extends GetView<ServiceController> {
  const SunUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 280,
      child: Container(
        width: 100,
        height: 130.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F3F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: FutureBuilder<WeatherData>(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 77,
                    height: 65,
                    child: Column(
                      children: [
                        const Text(
                          'SUNRISE',
                          style: TextStyle(
                            color: Color(0x5E141B34),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.48,
                          ),
                        ),
                        Text(
                          weatherData.days[0].sunrise,
                          style: const TextStyle(
                            color: Color(0xFF141B34),
                            fontSize: 19,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.76,
                          ),
                        ),
                        Text(
                          'SUNSET : ${weatherData.days[0].sunset}',
                          style: const TextStyle(
                            color: Color(0x4C141B34),
                            fontSize: 8,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                  ),
                  const Text(
                    'WIND',
                    style: TextStyle(
                      color: Color(0x5E141B34),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.48,
                    ),
                  ),
                  Text(
                    weatherData.days[0].windspeed.toString(),
                    style: const TextStyle(
                      color: Color(0xFF141B34),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                    ),
                  ),
                  const Text(
                    'MP/H',
                    style: TextStyle(
                      color: Color(0xFFB1B3BB),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.48,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
