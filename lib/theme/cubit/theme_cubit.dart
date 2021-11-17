import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_weather/weather/models/models.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;

class ThemeCubit extends HydratedCubit<Color> {
  static const defaultColor = Color(0xFF2196F3);
  ThemeCubit() : super(defaultColor);

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }

  @override
  Map<String, dynamic> toJson(Color state) {
    return <String, String>{'color': '${state.value}'};
  }
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.orangeAccent;
      case WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case WeatherCondition.cloudy:
        return Colors.blueGrey;
      case WeatherCondition.rainy:
        return Colors.indigoAccent;
      case WeatherCondition.unknown:
      default:
        return ThemeCubit.defaultColor;
    }
  }
}
