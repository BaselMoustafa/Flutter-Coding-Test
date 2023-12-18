import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_test/core/service_locator/service_locator.dart';
import 'package:flutter_coding_test/features/training_series/presentation/controllers/get_training_serieses_cubit/get_training_serieses_cubit.dart';
import 'package:flutter_coding_test/features/training_series/presentation/view/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => getIt<GetTrainingSeriesesCubit>()..getTrainingSerieses()))
      ], 
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
