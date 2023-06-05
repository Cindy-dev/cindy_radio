import 'package:isar/isar.dart';
part 'recently_played_db.g.dart';

@Collection()
class RecentlyPlayedDB {
  Id id = Isar.autoIncrement;
  String? stationuuid;
  String? name;
  String? url;
  String? favicon;
  String? tags;
  String? country;
  String? countrycode;
  int? clickcount;
}