import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/constants/constants.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/video.dart';

class TrainingClass extends Equatable{
  final String title;
  final Video video;

  const TrainingClass({required this.video,required this.title});

  factory TrainingClass.fromMap(Map<String,dynamic> map){
    return TrainingClass(
      title: map[KConst.title],
      video: map[KConst.video], 
    );
  }

  Map<String,dynamic> toMap(){
    return {
      KConst.title:title,
      KConst.video:video,
    };
  }

  @override
  List<Object?> get props => [
    title,
    video,
  ];
}