import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/constants/constants.dart';

class Person extends Equatable{
  final String name;
  final String photo;
  
  const Person({required this.photo,required this.name});

  factory Person.fromMap(Map<String,dynamic> map){
    return Person(
      name: map[KConst.name],
      photo: map[KConst.photo], 
    );
  }

  Map<String,dynamic> toMap(){
    return {
      KConst.name:name,
      KConst.photo:photo,
    };
  }

  @override
  List<Object?> get props => [
    name,
    photo,
  ];
}