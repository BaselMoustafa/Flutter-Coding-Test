import '../../../domain/enitity/training_series.dart';

abstract class GetTrainingSeriesesCubitStates{
  const GetTrainingSeriesesCubitStates();
}

class GetTrainingSeriesesInitialState extends GetTrainingSeriesesCubitStates{}

class GetTrainingSeriesesLoadingState extends GetTrainingSeriesesCubitStates{}

class GetTrainingSeriesesSuccessState extends GetTrainingSeriesesCubitStates{
  final List<TrainingSeries>trainingSerieses;
  const GetTrainingSeriesesSuccessState({required this.trainingSerieses});
}

class GetTrainingSeriesesFailedState extends GetTrainingSeriesesCubitStates{
  final String message;
  GetTrainingSeriesesFailedState({required this.message});
}