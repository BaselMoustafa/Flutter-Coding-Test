import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/constants/constants.dart';

class Video extends Equatable{
  final String title;
  final String video;

  const Video({required this.video,required this.title});

  factory Video.fromMap(Map<String,dynamic> map){
    return Video(
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