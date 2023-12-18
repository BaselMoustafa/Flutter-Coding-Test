import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_test/core/resources/navigator_manager/navigator_manager.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_series.dart';
import 'package:flutter_coding_test/features/training_series/presentation/controllers/get_training_serieses_cubit/get_training_serieses_cubit.dart';
import 'package:flutter_coding_test/features/training_series/presentation/controllers/get_training_serieses_cubit/get_training_serieses_cubit_states.dart';
import 'package:flutter_coding_test/features/training_series/presentation/view/training_series_screen.dart';
import 'package:flutter_coding_test/features/training_series/presentation/widgets/exception_widget.dart';
import 'package:flutter_coding_test/features/training_series/presentation/widgets/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetTrainingSeriesesCubit,GetTrainingSeriesesCubitStates>(
        builder: (context, state) {
          if(state is GetTrainingSeriesesLoadingState){
            return const LoadingWidget();
          }
          if(state is GetTrainingSeriesesFailedState){
            return ExceptionWidget(iconData: Icons.error, message: state.message) ;
          }
          if(state is GetTrainingSeriesesSuccessState){
            return _successBody(state.trainingSerieses);
          }
          return const SizedBox();
        },
      ),
    );
  }
  
  Widget _successBody(List<TrainingSeries>trainingSerieses) {
    return ListView.builder(
      itemCount: trainingSerieses.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: ()=>NavigatorManager.navigateTo(
            context, 
            TrainingSeriesDetailsScreen(trainingSeries: trainingSerieses[index])
          ), 
          child: Text("Training Series Number ${index+1}"),
        );
      },
    );
  }

  Widget _trainingSeriesImage(String url){
    return SizedBox(
      height: 400,
      child: Image.network(url),
    );
  }
}