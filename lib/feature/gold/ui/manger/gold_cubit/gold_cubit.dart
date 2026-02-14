import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/feature/gold/data/repo/gold_repo.dart';
import 'package:goldy/feature/gold/ui/manger/gold_cubit/gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldPriceRepo repository;

  GoldCubit(this.repository) : super(GoldInitial());

  Future<void> fetchGoldPrice() async {
    emit(GoldLoading());
    final result = await repository.getGoldPrice();

    result.fold(
      
      (failure) => emit(GoldError(failure.errmessage)), 
       (goldModel) => emit(GoldLoaded(goldModel)),   
     
    );
  }
}
