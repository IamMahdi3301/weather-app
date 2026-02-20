class Weather {
  final String cityName;
  final double tempreature;
  final String mainCondition;
  final double feelsLike;
  final double humidity;

  Weather({
    required this.cityName,
    required this.tempreature,
    required this.feelsLike,
    required this.mainCondition,
    required this.humidity,

  });

factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      tempreature: (json['main']?['temp'] ?? 0).toDouble(),
      feelsLike: (json['main']?['feels_like'] ?? 0).toDouble(),
      humidity: (json['main']?['humidity'] ?? 0).toDouble(),
      mainCondition: json['weather']?[0]?['main'] ?? "London",

    );
  }
}
