import 'package:dartz/dartz.dart';
import 'package:flutter_coding_test/core/error/failures.dart';
import 'package:flutter_coding_test/core/network/network_connection_info/network_connection_info.dart';
import 'package:flutter_coding_test/features/training_series/data/data_source/remote_data_source.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_series.dart';
import 'package:flutter_coding_test/features/training_series/domain/repo/repo.dart';
import '../../../../core/error/exceptions.dart';

class RepoImpl extends Repo{
  final RemoteDataSource remoteDataSource;
  final NetworkConnectionInfo networkConnectionInfo;
  const RepoImpl({required this.networkConnectionInfo,required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TrainingSeries>>> getTrainingSerieses() {
    return _exceptionHandler<List<TrainingSeries>>(
      functionToExcute: () async{
        return remoteDataSource.getTrainingSerieses();
      },
    );
  }

  Future<Either<Failure,T>> _exceptionHandler<T>({
    required  Future<T> Function() functionToExcute,
  })async{
    if( ! await networkConnectionInfo.isConnected){
      return const Left(OfflineFailure());
    }
    try {
      return Right(await functionToExcute.call());
    } on RemoteDataBaseException catch ( e) {
      return Left(RemoteDataBaseFailure(message: e.message)); 
    }on LocalDataBaseException catch(e){
      return Left(LocalDataBaseFailure(message: e.message));
    }
  }

}