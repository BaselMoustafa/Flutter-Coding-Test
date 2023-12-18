import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/constants/constants.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_class.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/video.dart';
import 'person.dart';
import 'post.dart';

class TrainingSeries extends Equatable {
  final String name;
  final String photo;
  final String description;
  final Video overviewVideo;
  final List<Person> coaches;
  final List<TrainingClass> classes;
  final List<Post> posts;

  const TrainingSeries({
    required this.classes,
    required this.coaches,
    required this.description,
    required this.photo,
    required this.name,
    required this.overviewVideo,
    required this.posts,
  });

  factory TrainingSeries.fromMap(Map map) {
    return TrainingSeries(
      classes: map[KConst.classes],
      coaches:  map[KConst.coaches],
      description:  map[KConst.description],
      photo:  map[KConst.photo],
      name:  map[KConst.name],
      overviewVideo:  map[KConst.overviewVideo],
      posts:  map[KConst.posts],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      KConst.classes:classes,
      KConst.coaches:coaches,
      KConst.description:description,
      KConst.photo:photo,
      KConst.name:name,
      KConst.overviewVideo:overviewVideo,
      KConst.posts:posts,
    };
  }

  @override
  List<Object?> get props => [
    classes,
    coaches,
    description,
    photo,
    name,
    overviewVideo,
    posts,
  ];
}
