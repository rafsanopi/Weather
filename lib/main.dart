import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather/design/hourly_forcast.dart';
import 'package:weather/service/api.dart';
import 'design/map.dart';
import 'design/radius_color.dart';
import 'design/sun_update.dart';
import 'design/tip_msg.dart';
import 'design/uv_index.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  Get.put(ServiceController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
          centerTitle: true,
          actions: const [Icon(Icons.more_vert)],
        ),
        body: const Stack(
          children: [
            RadiusColors(),
            UvIndex(),
            SunUpdate(),
            MapLocation(),
            TipMessage(),
            HourlyForcaste()
          ],
        ),
      ),
    );
  }
}
