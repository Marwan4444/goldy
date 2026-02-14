import 'package:dartz/dartz.dart';
import 'package:goldy/core/error/failures.dart';
import 'package:goldy/core/network/api_client.dart';
import 'package:goldy/feature/gold/data/model/gold_model.dart';

class GoldPriceRepo {


  GoldPriceRepo();

  Future<Either<ServerFailure, GoldModel>> getGoldPrice() async {
    try {
     
      final res = await ApiClient().get(url:"https://api.gold-api.com/price/XAU");

      
      final gold = GoldModel.fromJson(res);

      
      return Right(gold);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
     
      return Left(ServerFailure(e.toString()));
    }
  }
}
