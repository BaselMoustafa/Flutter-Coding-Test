
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_series.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/get_training_serieses.dart';
import 'get_training_serieses_cubit_states.dart';

class GetTrainingSeriesesCubit extends Cubit<GetTrainingSeriesesCubitStates>{

  final GetTrainingSeriesesUsecase getTrainingSeriesesUsecase;

  GetTrainingSeriesesCubit({required this.getTrainingSeriesesUsecase}):super(GetTrainingSeriesesInitialState());

  static GetTrainingSeriesesCubit get(BuildContext context)=>BlocProvider.of(context);

  Future<void>getTrainingSerieses()async{
    emit(GetTrainingSeriesesLoadingState());
    Either<Failure,List<TrainingSeries>>failureOrTrainingSerieses=await getTrainingSeriesesUsecase.excute();
    failureOrTrainingSerieses.fold(
      (Failure failure){
        emit(GetTrainingSeriesesFailedState(message: failure.message));
      }, 
      (List<TrainingSeries>trainingSerieses){
        emit(GetTrainingSeriesesSuccessState(trainingSerieses: trainingSerieses));
      },
    );
  }

}