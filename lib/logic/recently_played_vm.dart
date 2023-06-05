import 'package:cindy_radio/data/model/recently_played_db.dart';
import 'package:cindy_radio/data/repository/service/recently_played_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/radio_model.dart';

///Recently Played Station State
abstract class RecentlyPlayedStationState {
  const RecentlyPlayedStationState();
}

class RecentlyPlayedStationInitial extends RecentlyPlayedStationState {
  const RecentlyPlayedStationInitial();
}

class RecentlyPlayedStationLoading extends RecentlyPlayedStationState {
  const RecentlyPlayedStationLoading();
}

class RecentlyPlayedStationAdded extends RecentlyPlayedStationState {
  final RadioModel radioModel;
  RecentlyPlayedStationAdded(this.radioModel);
}

class RecentlyPlayedStationLoaded extends RecentlyPlayedStationState {
  final Stream<List<RecentlyPlayedDB>> recentStations;
  RecentlyPlayedStationLoaded(this.recentStations);
}

class RecentlyPlayedStationError extends RecentlyPlayedStationState {
  final String error;
  const RecentlyPlayedStationError(this.error);
}

///Recently Station provider
class RecentlyPlayedStationVM
    extends StateNotifier<RecentlyPlayedStationState> {
  final Ref ref;
  RecentlyPlayedStationVM(this.ref)
      : super(const RecentlyPlayedStationInitial());

  addToRecentlyPlayed({
    required String stationuuid,
    required String url,
    required String name,
    required int clickcount,
    required String country,
    required String countrycode,
    required String favicon,
    required String tags,
    int? id,
  }) {
    state = const RecentlyPlayedStationLoading();
    try {
      final result =
          ref.read(recentlyPlayedStationServiceProvider).addRecentlyPlayed(
                stationuuid: stationuuid,
                url: url,
                name: name,
                clickcount: clickcount,
                country: country,
                countrycode: countrycode,
                tags: tags,
                favicon: favicon,
              );
      state = RecentlyPlayedStationAdded(result);
    } catch (e) {
      state = RecentlyPlayedStationError(e.toString());
    }
  }
}

final recentlyPlayedStationVM =
    StateNotifierProvider<RecentlyPlayedStationVM, RecentlyPlayedStationState>(
        (ref) => RecentlyPlayedStationVM(ref));

final fetchRecentlyPlayedStationVM =
    StreamProvider<List<RecentlyPlayedDB>>((ref) {
  final recentlyPlayedStations =
      ref.watch(recentlyPlayedStationServiceProvider).getAllRecentlyPlayed();
  return recentlyPlayedStations;
});
