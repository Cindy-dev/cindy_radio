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

      return radioModel;
    } on SocketException {
      throw Exception("Please connect to the internet");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  List<String> extractTags(List<RadioModel> radioModels) {
    // initializes an empty Set to store the unique tags extracted from the RadioModel objects.
    Set<String> tagsSet = Set<String>();
    //starts a loop that iterates over each RadioModel object in the radioModels list.
    for (var radioModel in radioModels) {
      String tags = radioModel.tags.toString();
      if (tags.isNotEmpty) {
        //splits the tags string into individual tags using the comma (,) as the separator
        List<String> individualTags = tags.split(',');
        //adds all the individual tags to the tagsSet set after trimming any leading or trailing whitespace using the trim() method.
        tagsSet.addAll(individualTags.map((tag) => tag.trim()));
      }
    }
    return tagsSet.toList();
  }
}

final radioServiceProvider = Provider((ref) => RadioService());
