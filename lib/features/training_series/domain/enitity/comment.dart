import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/constants/constants.dart';

import 'person.dart';

class Comment extends Equatable{
  final Person owner;
  final String content;

  const Comment({required this.content,required this.owner});

  factory Comment.fromMap(Map<String,dynamic> map){
    return Comment(
      owner: map[KConst.owner],
      content: map[KConst.content], 
    );
  }

  Map<String,dynamic> toMap(){
    return {
      KConst.owner:owner,
      KConst.content:content,
    };
  }

  @override
  List<Object?> get props => [
    owner,
    content,
  ];
}