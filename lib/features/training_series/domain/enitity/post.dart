import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/constants/constants.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/person.dart';

import 'comment.dart';

class Post extends Equatable{
  final Person owner;
  final String content;
  final List<Comment>comments;

  const Post({required this.content,required this.owner,required this.comments});

  factory Post.fromMap(Map<String,dynamic> map){
    return Post(
      owner: map[KConst.owner],
      content: map[KConst.content], 
      comments: map[KConst.comments], 
    );
  }

  Map<String,dynamic> toMap(){
    return {
      KConst.owner:owner,
      KConst.content:content,
      KConst.comments:comments,
    };
  }

  @override
  List<Object?> get props => [
    owner,
    content,
    comments
  ];
}