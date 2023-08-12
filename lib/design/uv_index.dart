import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/service/api.dart';

import '../service/json_model.dart';

class UvIndex extends GetView<ServiceController> {
  const UvIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 165,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(
                  color: const Color(0xFF141B34),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x26141B34),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: FutureBuilder<WeatherData>(
                    future: controller.api(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        ); // Show a loading indicator while waiting for data
                      } else if (snapshot.hasError) {
                        return Text(
                            "Error: ${snapshot.error}"); // Show an error message if data fetch fails
                      } else if (!snapshot.hasData) {
                        return const Text(
                            "No data available"); // Handle case where no data is available
                      }

                      WeatherData weatherData = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              weatherData.days[0].icon[0] == "r"
                                  ? const Icon(
                                      Icons.water,
                                      color: Colors.blue,
                                    )
                                  : const Icon(Icons.sunny,
                                      color: Colors.yellow),
                              Text(
                                'UV INDEX',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.45),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.48,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  weatherData.days[0].uvindex.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  weatherData.days[0].conditions,
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.6000000238418579),
                                    fontSize: 8,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.48,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            const Positioned(
              left: 10,
              top: 17,
              child: SizedBox(
                width: 16,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
