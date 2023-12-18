import 'package:flutter_coding_test/core/network/network_connection_info/network_connection_info.dart';
import 'package:flutter_coding_test/features/training_series/data/data_source/remote_data_source.dart';
import 'package:flutter_coding_test/features/training_series/data/repo_impl/repo_impl.dart';
import 'package:flutter_coding_test/features/training_series/domain/repo/repo.dart';
import 'package:flutter_coding_test/features/training_series/domain/usecases/get_training_serieses.dart';
import 'package:flutter_coding_test/features/training_series/presentation/controllers/get_training_serieses_cubit/get_training_serieses_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../network/api/api_helper.dart';
import '../network/hive/hive_helper.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    //Cubits=============================================================
    getIt.registerFactory(
      () => GetTrainingSeriesesCubit(
        getTrainingSeriesesUsecase: getIt(),
      ),
    );
    
    //Usecases=============================================================
    getIt.registerLazySingleton(
      () => GetTrainingSeriesesUsecase(
        repo: getIt(),
      ),
    );
    
    //Reposatory=============================================================
    getIt.registerLazySingleton<Repo>(
      () =>RepoImpl(
        networkConnectionInfo: getIt(),
        remoteDataSource: getIt(),
      ),
    );


    //DataSource=============================================================
    getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
          apiHelper: getIt(),
        ));

    //Helpers================================================================
    getIt.registerLazySingleton<ApiHelper>(
      () => ApiHelperImpl()
    );
    getIt.registerLazySingleton<HiveHelper>(
      () => HiveHelperImpl()
    );
    getIt.registerLazySingleton<NetworkConnectionInfo>(
      () => NetworkConnectionInfoImple(
        internetConnectionChecker: InternetConnectionChecker(),
      )
    );
  }
}
