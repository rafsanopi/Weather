import 'dart:convert';

WeatherData2 weatherData2FromJson(String str) =>
    WeatherData2.fromJson(json.decode(str));

String weatherData2ToJson(WeatherData2 data) => json.encode(data.toJson());

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

Track trackFromJson(String str) => Track.fromJson(json.decode(str));

String trackToJson(Track data) => json.encode(data.toJson());

class WeatherData2 {
  final int? queryCost;
  final double? latitude;
  final double? longitude;
  final String? resolvedAddress;
  final String? address;
  final String? timezone;
  final double? tzoffset;
  final String? description;
  final List<CurrentConditions>? days;
  final List<dynamic>? alerts;
  final Stations? stations;
  final CurrentConditions? currentConditions;
  final String? name;
  final int? founded;
  final List<String>? members;

  WeatherData2({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.description,
    this.days,
    this.alerts,
    this.stations,
    this.currentConditions,
    this.name,
    this.founded,
    this.members,
  });

  factory WeatherData2.fromJson(Map<String, dynamic> json) => WeatherData2(
        queryCost: json["queryCost"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        resolvedAddress: json["resolvedAddress"],
        address: json["address"],
        timezone: json["timezone"],
        tzoffset: json["tzoffset"],
        description: json["description"],
        days: json["days"] == null
            ? []
            : List<CurrentConditions>.from(
                json["days"]!.map((x) => CurrentConditions.fromJson(x))),
        alerts: json["alerts"] == null
            ? []
            : List<dynamic>.from(json["alerts"]!.map((x) => x)),
        stations: json["stations"] == null
            ? null
            : Stations.fromJson(json["stations"]),
        currentConditions: json["currentConditions"] == null
            ? null
            : CurrentConditions.fromJson(json["currentConditions"]),
        name: json["name"],
        founded: json["founded"],
        members: json["members"] == null
            ? []
            : List<String>.from(json["members"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "queryCost": queryCost,
        "latitude": latitude,
        "longitude": longitude,
        "resolvedAddress": resolvedAddress,
        "address": address,
        "timezone": timezone,
        "tzoffset": tzoffset,
        "description": description,
        "days": days == null
            ? []
            : List<dynamic>.from(days!.map((x) => x.toJson())),
        "alerts":
            alerts == null ? [] : List<dynamic>.from(alerts!.map((x) => x)),
        "stations": stations?.toJson(),
        "currentConditions": currentConditions?.toJson(),
        "name": name,
        "founded": founded,
        "members":
            members == null ? [] : List<dynamic>.from(members!.map((x) => x)),
      };
}

class CurrentConditions {
  final String datetime;
  final int datetimeEpoch;
  final double temp;
  final double feelslike;
  final double humidity;
  final double dew;
  final double precip;
  final double precipprob;
  final int snow;
  final int snowdepth;
  final List<Icon>? preciptype;
  final double? windgust;
  final double windspeed;
  final double winddir;
  final double pressure;
  final double visibility;
  final double cloudcover;
  final double solarradiation;
  final double solarenergy;
  final int uvindex;
  final Conditions conditions;
  final Icon icon;
  final List<Id>? stations;
  final Source source;
  final String? sunrise;
  final int? sunriseEpoch;
  final String? sunset;
  final int? sunsetEpoch;
  final double? moonphase;
  final double? tempmax;
  final double? tempmin;
  final double? feelslikemax;
  final double? feelslikemin;
  final double? precipcover;
  final int? severerisk;
  final String? description;
  final List<CurrentConditions>? hours;

  CurrentConditions({
    required this.datetime,
    required this.datetimeEpoch,
    required this.temp,
    required this.feelslike,
    required this.humidity,
    required this.dew,
    required this.precip,
    required this.precipprob,
    required this.snow,
    required this.snowdepth,
    this.preciptype,
    this.windgust,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.visibility,
    required this.cloudcover,
    required this.solarradiation,
    required this.solarenergy,
    required this.uvindex,
    required this.conditions,
    required this.icon,
    this.stations,
    required this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  factory CurrentConditions.fromJson(Map<String, dynamic> json) =>
      CurrentConditions(
        datetime: json["datetime"],
        datetimeEpoch: json["datetimeEpoch"],
        temp: json["temp"]?.toDouble(),
        feelslike: json["feelslike"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        dew: json["dew"]?.toDouble(),
        precip: json["precip"]?.toDouble(),
        precipprob: json["precipprob"]?.toDouble(),
        snow: json["snow"],
        snowdepth: json["snowdepth"],
        preciptype: json["preciptype"] == null
            ? []
            : List<Icon>.from(
                json["preciptype"]!.map((x) => iconValues.map[x]!)),
        windgust: json["windgust"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddir: json["winddir"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        visibility: json["visibility"]?.toDouble(),
        cloudcover: json["cloudcover"]?.toDouble(),
        solarradiation: json["solarradiation"]?.toDouble(),
        solarenergy: json["solarenergy"]?.toDouble(),
        uvindex: json["uvindex"],
        conditions: conditionsValues.map[json["conditions"]]!,
        icon: iconValues.map[json["icon"]]!,
        stations: json["stations"] == null
            ? []
            : List<Id>.from(json["stations"]!.map((x) => idValues.map[x]!)),
        source: sourceValues.map[json["source"]]!,
        sunrise: json["sunrise"],
        sunriseEpoch: json["sunriseEpoch"],
        sunset: json["sunset"],
        sunsetEpoch: json["sunsetEpoch"],
        moonphase: json["moonphase"]?.toDouble(),
        tempmax: json["tempmax"]?.toDouble(),
        tempmin: json["tempmin"]?.toDouble(),
        feelslikemax: json["feelslikemax"]?.toDouble(),
        feelslikemin: json["feelslikemin"]?.toDouble(),
        precipcover: json["precipcover"]?.toDouble(),
        severerisk: json["severerisk"],
        description: json["description"],
        hours: json["hours"] == null
            ? []
            : List<CurrentConditions>.from(
                json["hours"]!.map((x) => CurrentConditions.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datetime": datetime,
        "datetimeEpoch": datetimeEpoch,
        "temp": temp,
        "feelslike": feelslike,
        "humidity": humidity,
        "dew": dew,
        "precip": precip,
        "precipprob": precipprob,
        "snow": snow,
        "snowdepth": snowdepth,
        "preciptype": preciptype == null
            ? []
            : List<dynamic>.from(preciptype!.map((x) => iconValues.reverse[x])),
        "windgust": windgust,
        "windspeed": windspeed,
        "winddir": winddir,
        "pressure": pressure,
        "visibility": visibility,
        "cloudcover": cloudcover,
        "solarradiation": solarradiation,
        "solarenergy": solarenergy,
        "uvindex": uvindex,
        "conditions": conditionsValues.reverse[conditions],
        "icon": iconValues.reverse[icon],
        "stations": stations == null
            ? []
            : List<dynamic>.from(stations!.map((x) => idValues.reverse[x])),
        "source": sourceValues.reverse[source],
        "sunrise": sunrise,
        "sunriseEpoch": sunriseEpoch,
        "sunset": sunset,
        "sunsetEpoch": sunsetEpoch,
        "moonphase": moonphase,
        "tempmax": tempmax,
        "tempmin": tempmin,
        "feelslikemax": feelslikemax,
        "feelslikemin": feelslikemin,
        "precipcover": precipcover,
        "severerisk": severerisk,
        "description": description,
        "hours": hours == null
            ? []
            : List<dynamic>.from(hours!.map((x) => x.toJson())),
      };
}

enum Conditions {
  CLEAR,
  OVERCAST,
  PARTIALLY_CLOUDY,
  RAIN,
  RAIN_OVERCAST,
  RAIN_PARTIALLY_CLOUDY
}

final conditionsValues = EnumValues({
  "Clear": Conditions.CLEAR,
  "Overcast": Conditions.OVERCAST,
  "Partially cloudy": Conditions.PARTIALLY_CLOUDY,
  "Rain": Conditions.RAIN,
  "Rain, Overcast": Conditions.RAIN_OVERCAST,
  "Rain, Partially cloudy": Conditions.RAIN_PARTIALLY_CLOUDY
});

enum Icon { CLEAR_NIGHT, CLOUDY, PARTLY_CLOUDY_DAY, PARTLY_CLOUDY_NIGHT, RAIN }

final iconValues = EnumValues({
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "rain": Icon.RAIN
});

enum Source { COMB, FCST, OBS }

final sourceValues =
    EnumValues({"comb": Source.COMB, "fcst": Source.FCST, "obs": Source.OBS});

enum Id { VEAT, VGHS }

final idValues = EnumValues({"VEAT": Id.VEAT, "VGHS": Id.VGHS});

class Stations {
  final Veat vghs;
  final Veat veat;

  Stations({
    required this.vghs,
    required this.veat,
  });

  factory Stations.fromJson(Map<String, dynamic> json) => Stations(
        vghs: Veat.fromJson(json["VGHS"]),
        veat: Veat.fromJson(json["VEAT"]),
      );

  Map<String, dynamic> toJson() => {
        "VGHS": vghs.toJson(),
        "VEAT": veat.toJson(),
      };
}

class Veat {
  final int distance;
  final double latitude;
  final double longitude;
  final int useCount;
  final Id id;
  final Id name;
  final int quality;
  final int contribution;

  Veat({
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.useCount,
    required this.id,
    required this.name,
    required this.quality,
    required this.contribution,
  });

  factory Veat.fromJson(Map<String, dynamic> json) => Veat(
        distance: json["distance"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        useCount: json["useCount"],
        id: idValues.map[json["id"]]!,
        name: idValues.map[json["name"]]!,
        quality: json["quality"],
        contribution: json["contribution"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "latitude": latitude,
        "longitude": longitude,
        "useCount": useCount,
        "id": idValues.reverse[id],
        "name": idValues.reverse[name],
        "quality": quality,
        "contribution": contribution,
      };
}

class Album {
  final String name;
  final Artist artist;
  final List<Track> tracks;

  Album({
    required this.name,
    required this.artist,
    required this.tracks,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        artist: Artist.fromJson(json["artist"]),
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "artist": artist.toJson(),
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
      };
}

class Artist {
  final String name;
  final int founded;
  final List<String> members;

  Artist({
    required this.name,
    required this.founded,
    required this.members,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        founded: json["founded"],
        members: List<String>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "founded": founded,
        "members": List<dynamic>.from(members.map((x) => x)),
      };
}

class Track {
  final String name;
  final int duration;

  Track({
    required this.name,
    required this.duration,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        name: json["name"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
