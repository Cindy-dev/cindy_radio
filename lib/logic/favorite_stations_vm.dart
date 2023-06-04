import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/data/repository/service/favorite_radio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Favorite Station State
abstract class FavoriteStationState {
  const FavoriteStationState();
}

class FavoriteStationInitial extends FavoriteStationState {
  const FavoriteStationInitial();
}

class FavoriteStationLoading extends FavoriteStationState {
  const FavoriteStationLoading();
}

class FavoriteStationAdded extends FavoriteStationState {
  final RadioModel radioModel;
  FavoriteStationAdded(this.radioModel);
}

class FavoriteStationLoaded extends FavoriteStationState {
  final List<RadioModel> radioModel;
  FavoriteStationLoaded(this.radioModel);
}

class FavoriteStationError extends FavoriteStationState {
  final String error;
  const FavoriteStationError(this.error);
}

///Favorite Station provider
class FavoriteStationVM extends StateNotifier<FavoriteStationState> {
  final Ref ref;
  FavoriteStationVM(this.ref) : super(const FavoriteStationInitial());

  addToFavorite(RadioModel radioModel) {
    state = const FavoriteStationLoading();
    try {
      final result = ref
          .read(favoriteRadioStationServiceProvider)
          .toggleFavoriteItem(radioModel);
      state = FavoriteStationAdded(result);
    } catch (e) {
      state = FavoriteStationError(e.toString());
    }
  }

  fetchFavoriteStations() {
    state = const FavoriteStationLoading();
    try {
      final result = ref.read(favoriteRadioStationServiceProvider).faveModels;
      state = FavoriteStationLoaded(result);
      return result;
    } catch (e) {
      state = FavoriteStationError(e.toString());
    }
  }
}

final favoriteStationVM =
    StateNotifierProvider<FavoriteStationVM, FavoriteStationState>(
        (ref) => FavoriteStationVM(ref));

final fetchFavoriteStationVM =
    FutureProvider((ref) => FavoriteStationVM(ref).fetchFavoriteStations());
