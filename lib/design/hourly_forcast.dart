import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/service/api.dart';
import 'package:weather/service/json_model.dart';

class HourlyForcaste extends GetView<ServiceController> {
  const HourlyForcaste({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20.h,
        left: 10.w,
        right: 10.w,
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
              return SizedBox(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    String currentHour = "0${DateTime.now().hour}:00:00";

                    print(currentHour);
                    String hours = weatherData.days[index].hours[index].datetime
                        .toString();
                    return Container(
                      height: 120.h,
                      width: 58.w,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: ShapeDecoration(
                        color: hours == currentHour
                            ? const Color(0xFF141B34)
                            : const Color(0x59141B34),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color:
                                Colors.white.withOpacity(0.20000000298023224),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(2, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hours == currentHour ? "Now" : hours,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              height: 1.33,
                              letterSpacing: -0.50,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                weatherData.days[index].hours[index].feelslike
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF40CBD8),
                                  fontSize: 13,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w900,
                                  height: 1.38,
                                  letterSpacing: -0.08,
                                ),
                              ),
                              SizedBox(
                                width: 32,
                                height: 32,
                                child: weatherData.days[0].icon[0] == "r"
                                    ? const Icon(
                                        Icons.water,
                                        color: Colors.blue,
                                      )
                                    : const Icon(Icons.sunny,
                                        color: Colors.yellow),
                              ),
                            ],
                          ),
                          Text(
                            weatherData.days[index].hours[index].temp
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }));
  }
}
