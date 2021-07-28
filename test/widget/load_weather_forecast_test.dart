import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/shared/core_utils.dart';
import 'package:weather_app/weather_forecast/view/weather_forecast_page.dart';
import 'package:weather_app/weather_forecast/view/widgets/weather_info_widget.dart';

import '../mock_weather_service.dart';

void main() {
  group("Weather forecast page", () {
    testWidgets('Test if widget shows loading and current weather data',
        (WidgetTester tester) async {
      setupGetIt();

      await tester.pumpWidget(MaterialApp(
        home: WeatherForecastPage(
          city: 'Silverstone',
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsWidgets);

      await tester.idle();

      await tester.pump(Duration.zero);

      expect(find.byType(WeatherInfoWidget), findsWidgets);
    });

    testWidgets('Test if widget shows loading and error',
        (WidgetTester tester) async {
      final weatherService = MockWeatherService();

      when(weatherService.getCurrentWeather('Silverstone'))
          .thenAnswer((realInvocation) => Future.error(Exception()));

      await tester.pumpWidget(MaterialApp(
        home: WeatherForecastPage(
          city: 'Silverstone',
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsWidgets);

      await tester.idle();

      await tester.pump(Duration.zero);

      expect(find.text('An error occurred, try again later'), findsOneWidget);
    });
  });
}
