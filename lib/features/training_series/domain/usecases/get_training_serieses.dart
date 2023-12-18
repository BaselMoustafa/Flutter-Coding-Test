import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/error/failures.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_series.dart';
import 'package:flutter_coding_test/features/training_series/domain/repo/repo.dart';

class GetTrainingSeriesesUsecase extends Equatable{
  final Repo repo;
  const GetTrainingSeriesesUsecase({required this.repo});
  Future<Either<Failure,List<TrainingSeries>>>excute()async{
    return await repo.getTrainingSerieses();
  }

  @override
  List<Object?> get props => [repo];

}