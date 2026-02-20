class Weather {
  final String cityName;
  final double tempreature;
  final String mainCondition;
  final double feelsLike;

  Weather({
    required this.cityName,
    required this.tempreature,
    required this.feelsLike,
    required this.mainCondition,

  });

factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      tempreature: (json['main']?['temp'] ?? 0).toDouble(),
      feelsLike: (json['main']?['feels_like'] ?? 0).toDouble(),
      mainCondition: json['weather']?[0]?['main'] ?? "London",
    );
  }
}
