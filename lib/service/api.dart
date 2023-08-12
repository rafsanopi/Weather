import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather/service/json_model.dart';

class ServiceController extends GetxController {
  // WeatherHour weatherHour = WeatherHour();
  Future<WeatherData> api() async {
    try {
      var url =
          "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/dhaka?unitGroup=metric&key=YY8QJLMXBBSNEZVVD4AM8KCZQ&contentType=json";

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return WeatherData.fromJson(data);
      }
    } catch (e) {
      // Handle the exception here, e.g., print an error message
      print("Error fetching weather data: $e");
      throw Exception("Failed to fetch weather data");
    }

    // If the request failed or encountered an exception, return a default WeatherData object
    return WeatherData(
      days: [],
      queryCost: 0,
      latitude: 0.0,
      longitude: 0.0,
      resolvedAddress: "",
      address: "",
      timezone: "",
      tzoffset: 0.0,
      description: "",
    );
  }

  @override
  void onInit() {
    api();
    super.onInit();
  }
}
