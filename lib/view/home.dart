import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/view/setting_page.dart';
import '../controller/weather_controller.dart';
import '../models/weather_model.dart';
import '../resources/strings.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final weatherController = ref.watch(weatherControllerProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text(Strings.cityWeather,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(Strings.majorCityWeather,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          MajorCities(weatherController: weatherController),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    ));
  }
}

// show 5 city's weather  data

class MajorCities extends StatelessWidget {
  final WeatherController weatherController;
  const MajorCities({Key? key, required this.weatherController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<List<WeatherModel>>(
      future: weatherController.fetchWeatherDataForCities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No data available'),
          );
        } else {
          final weatherList = snapshot.data as List<WeatherModel>;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: size.height * 0.78,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5, //weatherList.length,
              reverse: false,
              itemBuilder: (context, index) {
                final weatherInfo = weatherList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4.0),
                  child: Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/images/sun.png',
                            width: 100,
                            height: 120,
                          ),
                          SizedBox(
                            child: Center(
                              child: Column(
                                children: weatherInfo.data!.map((cityWeather) {
                                  return Text(
                                    "${cityWeather.cityName ?? ""}\n${cityWeather.temp} °C",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children:
                                        weatherInfo.data!.map((cityWeather) {
                                      return Text(
                                        cityWeather.weather!.description
                                            .toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
