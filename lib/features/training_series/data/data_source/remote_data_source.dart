import 'package:equatable/equatable.dart';
import 'package:flutter_coding_test/core/network/api/api_helper.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/comment.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/person.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/post.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/training_class.dart';
import 'package:flutter_coding_test/features/training_series/domain/enitity/video.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/enitity/training_series.dart';

abstract class RemoteDataSource extends Equatable{
  const RemoteDataSource();
  Future<List<TrainingSeries>>getTrainingSerieses();
}

class RemoteDataSourceImpl extends RemoteDataSource{

  final ApiHelper apiHelper;
  const RemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<List<TrainingSeries>> getTrainingSerieses() {
    return _tryAndCatchBlock<List<TrainingSeries>>(
      message: "Failed At Get Trainig Serieses",
      functionToExcute: ()async {
        /*
          The Correct Code =============================

          final List<TrainingSeries>trainingSeries=[];
          Map<String,dynamic> response=await apiHelper.get(
            const ApiRequestModel(endPoint: "Target End Pint",headers: {},body: {},queries: {},),
          );
          for (var i = 0; i < response[KConst.serieses].length; i++) {
            trainingSeries.add(
              TrainingSeries.fromMap(response[KConst.serieses][i]),
            );
          }
          return trainingSeries;

        */
        return dummyData;
      },
    );
  }

  Future<T>_tryAndCatchBlock<T>({
    required Future<T> Function()functionToExcute,
    required String message,
  })async{
    try {
      return await functionToExcute();
    } catch (ex) {
      throw RemoteDataBaseException(message: message);
    }
  }
  
  @override
  List<Object?> get props => [apiHelper];
  
}

List<TrainingSeries>dummyData=[
  const TrainingSeries(
    name: "Series 1",
    photo: "https://www.shutterstock.com/image-photo/personal-trainer-arms-crossed-gym-260nw-493318507.jpg", 
    description: "Description For Series 1", 
    overviewVideo: Video(
      title: "First Video",
      video: "https://www.youtube.com/watch?v=FP8RT4pFRZI", 
    ),
    coaches: [
      Person(
        name: "Basel Moustafa",
        photo: "https://www.shutterstock.com/image-photo/personal-trainer-arms-crossed-gym-260nw-493318507.jpg", 
      ),
    ],  
    classes: [
      TrainingClass(title: "Class 1",video: Video(video: "https://www.youtube.com/watch?v=FP8RT4pFRZI", title: "Video Label"),),
      TrainingClass(title: "Class 2",video: Video(video: "https://www.youtube.com/watch?v=FP8RT4pFRZI", title: "Video Label"),),
    ], 
    posts: [
      Post(
        content: "Post 1", 
        owner: Person(
          name: "Ahmed",
          photo: "https://www.shutterstock.com/image-photo/personal-trainer-arms-crossed-gym-260nw-493318507.jpg", 
        ), 
        comments: [
          Comment(
            content: "Comment 1", 
            owner: Person(
              name: "Mouhamemd",
              photo: "https://www.shutterstock.com/image-photo/personal-trainer-arms-crossed-gym-260nw-493318507.jpg", 
            )
          ),
        ],
      ),
    ],
  )
];

