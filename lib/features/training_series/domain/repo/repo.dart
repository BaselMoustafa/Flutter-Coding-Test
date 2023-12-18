import 'package:dartz/dartz.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_series.dart';
import '../../../../core/error/failures.dart';

abstract class Repo {
  const Repo();
  Future<Either<Failure,List<TrainingSeries>>>getTrainingSerieses();
}