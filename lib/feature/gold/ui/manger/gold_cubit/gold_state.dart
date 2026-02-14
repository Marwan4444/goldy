import 'package:goldy/feature/gold/data/model/gold_model.dart';

abstract class GoldState {}

class GoldInitial extends GoldState {}

class GoldLoading extends GoldState {}

class GoldLoaded extends GoldState {
  final GoldModel gold;
  GoldLoaded(this.gold);
}

class GoldError extends GoldState {
  final String message;
  GoldError(this.message);
}
