import 'package:isar/isar.dart';
part 'favorite_db.g.dart';

@Collection()
class FavoriteDB {
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
