// To parse this JSON data, do
//
//     final radioModel = radioModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<RadioModel> radioModelFromJson(String str) => List<RadioModel>.from(json.decode(str).map((x) => RadioModel.fromJson(x)));

String radioModelToJson(List<RadioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RadioModel extends Equatable{
    String? changeuuid;
    String? stationuuid;
    String? serveruuid;
    String? name;
    String? url;
    String? urlResolved;
    String? homepage;
    String? favicon;
    String? tags;
    String? country;
    String? countrycode;
    dynamic iso31662;
    String? state;
    String? language;
    String? languagecodes;
    num? votes;
    String? lastchangetime;
    String? lastchangetimeIso8601;
    String? codec;
    num? bitrate;
    num? hls;
    num? lastcheckok;
    String? lastchecktime;
    String? lastchecktimeIso8601;
    String? lastcheckoktime;
    String? lastcheckoktimeIso8601;
    String? lastlocalchecktime;
    String? lastlocalchecktimeIso8601;
    String? clicktimestamp;
    String? clicktimestampIso8601;
    num? clickcount;
    num? clicktrend;
    num? sslError;
    dynamic geoLat;
    dynamic geoLong;
    bool? hasExtendedInfo;

    RadioModel({
        required this.changeuuid,
        required this.stationuuid,
        required this.serveruuid,
        required this.name,
        required this.url,
        required this.urlResolved,
        required this.homepage,
        required this.favicon,
        required this.tags,
        required this.country,
        required this.countrycode,
        this.iso31662,
        required this.state,
        required this.language,
        required this.languagecodes,
        required this.votes,
        required this.lastchangetime,
        required this.lastchangetimeIso8601,
        required this.codec,
        required this.bitrate,
        required this.hls,
        required this.lastcheckok,
        required this.lastchecktime,
        required this.lastchecktimeIso8601,
        required this.lastcheckoktime,
        required this.lastcheckoktimeIso8601,
        required this.lastlocalchecktime,
        required this.lastlocalchecktimeIso8601,
        required this.clicktimestamp,
        required this.clicktimestampIso8601,
        required this.clickcount,
        required this.clicktrend,
        required this.sslError,
        this.geoLat,
        this.geoLong,
        required this.hasExtendedInfo,
    });

    factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        changeuuid: json["changeuuid"],
        stationuuid: json["stationuuid"],
        serveruuid: json["serveruuid"],
        name: json["name"],
        url: json["url"],
        urlResolved: json["url_resolved"],
        homepage: json["homepage"],
        favicon: json["favicon"],
        tags: json["tags"],
        country: json["country"],
        countrycode: json["countrycode"],
        iso31662: json["iso_3166_2"],
        state: json["state"],
        language: json["language"],
        languagecodes: json["languagecodes"],
        votes: json["votes"],
        lastchangetime: json["lastchangetime"],
        lastchangetimeIso8601: json["lastchangetime_iso8601"],
        codec: json["codec"],
        bitrate: json["bitrate"],
        hls: json["hls"],
        lastcheckok: json["lastcheckok"],
        lastchecktime: json["lastchecktime"],
        lastchecktimeIso8601: json["lastchecktime_iso8601"],
        lastcheckoktime: json["lastcheckoktime"],
        lastcheckoktimeIso8601: json["lastcheckoktime_iso8601"],
        lastlocalchecktime: json["lastlocalchecktime"],
        lastlocalchecktimeIso8601: json["lastlocalchecktime_iso8601"],
        clicktimestamp: json["clicktimestamp"],
        clicktimestampIso8601: json["clicktimestamp_iso8601"],
        clickcount: json["clickcount"],
        clicktrend: json["clicktrend"],
        sslError: json["ssl_error"],
        geoLat: json["geo_lat"],
        geoLong: json["geo_long"],
        hasExtendedInfo: json["has_extended_info"],
    );

    Map<String, dynamic> toJson() => {
        "changeuuid": changeuuid,
        "stationuuid": stationuuid,
        "serveruuid": serveruuid,
        "name": name,
        "url": url,
        "url_resolved": urlResolved,
        "homepage": homepage,
        "favicon": favicon,
        "tags": tags,
        "country": country,
        "countrycode": countrycode,
        "iso_3166_2": iso31662,
        "state": state,
        "language": language,
        "languagecodes": languagecodes,
        "votes": votes,
        "lastchangetime": lastchangetime,
        "lastchangetime_iso8601": lastchangetimeIso8601,
        "codec": codec,
        "bitrate": bitrate,
        "hls": hls,
        "lastcheckok": lastcheckok,
        "lastchecktime": lastchecktime,
        "lastchecktime_iso8601": lastchecktimeIso8601,
        "lastcheckoktime": lastcheckoktime,
        "lastcheckoktime_iso8601": lastcheckoktimeIso8601,
        "lastlocalchecktime": lastlocalchecktime,
        "lastlocalchecktime_iso8601": lastlocalchecktimeIso8601,
        "clicktimestamp": clicktimestamp,
        "clicktimestamp_iso8601": clicktimestampIso8601,
        "clickcount": clickcount,
        "clicktrend": clicktrend,
        "ssl_error": sslError,
        "geo_lat": geoLat,
        "geo_long": geoLong,
        "has_extended_info": hasExtendedInfo,
    };

  @override
  List<Object?> get props => throw UnimplementedError();
}
