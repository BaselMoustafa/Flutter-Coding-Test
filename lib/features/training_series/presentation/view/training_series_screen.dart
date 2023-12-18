import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_coding_test/core/resources/color_manager/color_manager.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_series.dart';


class TrainingSeriesDetailsScreen extends StatelessWidget {
  const TrainingSeriesDetailsScreen({super.key,required this.trainingSeries});
  final TrainingSeries trainingSeries;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorManager.transparent,),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: ListView(
        children: [
          _trainingSeriesImage(),
          _trainingSeriesName(),
        ],
      ),
    );
  }
  
  Widget _trainingSeriesImage(){
    return SizedBox(
      height: 400,
      child: Image.network(trainingSeries.photo,fit: BoxFit.cover,),
    );
  }
  Widget _trainingSeriesName(){
    return Center(
      child: Text(
        trainingSeries.name,
        style:const TextStyle(fontSize: 28),
      ),
    );
  }
}