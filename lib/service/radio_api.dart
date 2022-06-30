import 'dart:convert';
import 'dart:io';

import 'package:cindy_radio/model/radio_model.dart';
import 'package:cindy_radio/model/response_data.dart';
import 'package:http/http.dart' as Client;
import 'dart:async';


class RadioAPI {
  Future<RadioModel> fetchStations() async {
    final url =
        "https://de1.api.radio-browser.info/json/stations";
    var respBody;

    print(url);
    


    try {
      final httpResponse = await Client.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      print(json.decode(httpResponse.statusCode.toString()));
      print(json.decode(httpResponse.body));

      if (httpResponse.statusCode == 200) {
        respBody = jsonDecode(httpResponse.body);
        ResponseData.radioResponseModel = RadioModel.fromJson(respBody[0]);
        print((ResponseData.radioResponseModel).toString());
      
  
      }
    } on Exception catch (e) {
      
      print(e.toString());
    }
    return ResponseData.radioResponseModel;
    
  }
}
