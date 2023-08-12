class WeatherData {
  final int queryCost;
  final double latitude;
  final double longitude;
  final String resolvedAddress;
  final String address;
  final String timezone;
  final double tzoffset;
  final String description;
  final List<WeatherDay> days;

  WeatherData({
    required this.days,
    required this.queryCost,
    required this.latitude,
    required this.longitude,
    required this.resolvedAddress,
    required this.address,
    required this.timezone,
    required this.tzoffset,
    required this.description,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    List<WeatherDay> days = [];
    if (json['days'] != null) {
      for (var dayJson in json['days']) {
        days.add(WeatherDay.fromJson(dayJson));
      }
    }

    return WeatherData(
      days: days,
      queryCost: json['queryCost'] ?? 0,
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      resolvedAddress: json['resolvedAddress'] ?? '',
      address: json['address'] ?? '',
      timezone: json['timezone'] ?? '',
      tzoffset: json['tzoffset'] ?? 0.0,
      description: json['description'] ?? '',
    );
  }
}

class WeatherDay {
  final String datetime;
  final int datetimeEpoch;
  final double tempmax;
  final double tempmin;
  final double temp;
  final double feelslikemax;
  final double feelslikemin;
  final double feelslike;
  final double dew;
  final double humidity;
  final double precip;
  final double precipprob;
  final double precipcover;
  final List<String> preciptype;
  final double snow;
  final double snowdepth;
  final double windgust;
  final double windspeed;
  final double winddir;
  final double pressure;
  final double cloudcover;
  final double visibility;
  final double solarradiation;
  final double solarenergy;
  final double uvindex;
  final double severerisk;
  final String sunrise;
  final int sunriseEpoch;
  final String sunset;
  final int sunsetEpoch;
  final double moonphase;
  final String conditions;
  final String description;
  final String icon;
  final List<String> stations;
  final String source;
  final List<WeatherHour> hours;

  WeatherDay({
    required this.datetime,
    required this.datetimeEpoch,
    required this.tempmax,
    required this.tempmin,
    required this.temp,
    required this.feelslikemax,
    required this.feelslikemin,
    required this.feelslike,
    required this.dew,
    required this.humidity,
    required this.precip,
    required this.precipprob,
    required this.precipcover,
    required this.preciptype,
    required this.snow,
    required this.snowdepth,
    required this.windgust,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.cloudcover,
    required this.visibility,
    required this.solarradiation,
    required this.solarenergy,
    required this.uvindex,
    required this.severerisk,
    required this.sunrise,
    required this.sunriseEpoch,
    required this.sunset,
    required this.sunsetEpoch,
    required this.moonphase,
    required this.conditions,
    required this.description,
    required this.icon,
    required this.stations,
    required this.source,
    required this.hours,
  });

  factory WeatherDay.fromJson(Map<String, dynamic> json) {
    List<WeatherHour> hours = [];
    if (json['hours'] != null) {
      for (var hourJson in json['hours']) {
        hours.add(WeatherHour.fromJson(hourJson));
      }
    }

    return WeatherDay(
      datetime: json['datetime'],
      datetimeEpoch: json['datetimeEpoch'] ?? 0,
      tempmax: json['tempmax'] ?? 0.0,
      tempmin: json['tempmin'] ?? 0.0,
      temp: json['temp'] ?? 0.0,
      feelslikemax: json['feelslikemax'] ?? 0.0,
      feelslikemin: json['feelslikemin'] ?? 0.0,
      feelslike: json['feelslike'] ?? 0.0,
      dew: json['dew'] ?? 0.0,
      humidity: json['humidity'] ?? 0.0,
      precip: json['precip'] ?? 0.0,
      precipprob: json['precipprob'] ?? 0.0,
      precipcover: json['precipcover'] ?? 0.0,
      preciptype: List<String>.from(json['preciptype'] ?? []),
      snow: json['snow'] ?? 0.0,
      snowdepth: json['snowdepth'] ?? 0.0,
      windgust: json['windgust'] ?? 0.0,
      windspeed: json['windspeed'] ?? 0.0,
      winddir: json['winddir'] ?? 0.0,
      pressure: json['pressure'] ?? 0.0,
      cloudcover: json['cloudcover'] ?? 0.0,
      visibility: json['visibility'] ?? 0.0,
      solarradiation: json['solarradiation'] ?? 0.0,
      solarenergy: json['solarenergy'] ?? 0.0,
      uvindex: json['uvindex'] ?? 0.0,
      severerisk: json['severerisk'] ?? 0.0,
      sunrise: json['sunrise'] ?? '00:00:00',
      sunriseEpoch: json['sunriseEpoch'] ?? 0,
      sunset: json['sunset'] ?? '00:00:00',
      sunsetEpoch: json['sunsetEpoch'] ?? 0,
      moonphase: json['moonphase'] ?? 0.0,
      conditions: json['conditions'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      stations: List<String>.from(json['stations'] ?? []),
      source: json['source'] ?? " ",
      hours: hours,
    );
  }
}

class WeatherHour {
  final String datetime;
  final int datetimeEpoch;
  final double temp;
  final double feelslike;

  WeatherHour({
    required this.datetime,
    required this.datetimeEpoch,
    required this.temp,
    required this.feelslike,
  });

  factory WeatherHour.fromJson(Map<String, dynamic> json) {
    return WeatherHour(
      datetime: json['datetime'] ?? "Unknown",
      datetimeEpoch: json['datetimeEpoch'] ?? 0, // Provide a default value
      temp: json['temp'] ?? 0.0, // Provide a default value
      feelslike: json['feelslike'] ?? 0.0, // Provide a default value
    );
  }
}
