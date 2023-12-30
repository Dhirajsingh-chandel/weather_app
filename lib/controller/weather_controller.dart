import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather_model.dart';
import '../network/urls.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';



final weatherControllerProvider = Provider<WeatherController>((ref) {
  return WeatherController();
});

class WeatherController extends ChangeNotifier {
  //city's for weather data
  List<String> cityNames = ['Pune', 'Mumbai', 'Delhi', 'Bangalore', 'Kolkata'];
  List<WeatherModel> weatherDataList = [];

  // method for fetch major city's data
  Future<WeatherModel> fetchWeatherData({String? city, context}) async {
    // Default city name as Pune if no city is provided
    final cityName = city ?? "Pune";
    final url =
        'https://api.weatherbit.io/v2.0/current?city=$cityName&country=India&key=${Urls.apiKey}';

    // Check for internet connectivity before making the API call
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No internet connection available.')));
      throw Exception('No internet connection available.');
    }

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        if (kDebugMode) {
          print('Data found$decodedData');
        }
        return WeatherModel.fromJson(decodedData);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.statusCode.toString())));
        throw Exception(
            'Failed to load data for $cityName: ${response.statusCode}');
      }
    } catch (e) {
      // Handle various types of exceptions that might occur during the API call
      if (kDebugMode) {
        print('Exception during fetchWeatherData call: $e');
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }
      if (e is SocketException) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No internet connection available.')));
        throw Exception(
            'Failed to fetch data for $cityName. Please check your internet connection.');
      } else {
        rethrow; // Rethrow any other exception types
      }
    }
  }

// loop for get different city's data
  Future<List<WeatherModel>> fetchWeatherDataForCities() async {
    for (final cityName in cityNames) {
      try {
        final weatherData = await fetchWeatherData(city: cityName);
        weatherDataList.add(weatherData);
      } catch (e) {
        // Handle error if fetching data fails for a city
        if (kDebugMode) {
          print('Error fetching data for $cityName: $e');
        }
      }
    }
    return weatherDataList;
  }
}
