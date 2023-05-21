import 'dart:io';
import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioService {
  final dio = Dio();
  Future<List<RadioModel>> fetchStations() async {
    final url = "https://de1.api.radio-browser.info/json/stations";
    try {
      final response = await dio.get(url);
      final radioModel = List<RadioModel>.from(
          response.data.map((x) => RadioModel.fromJson(x)));
      print(response.data);
      return radioModel;
    } on SocketException {
      throw Exception("Please connect to the internet");
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

final radioServiceProvider = Provider((ref) => RadioService());
