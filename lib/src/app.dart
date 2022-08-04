import 'package:app_flutter_thientin/src/apply/cubit/apply_cubit.dart';
import 'package:app_flutter_thientin/src/apply/index.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/login/index.dart';
import 'package:app_flutter_thientin/src/login/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/apply/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/profile/screens/index.dart';
import 'package:flutter/material.dart';

import 'home/index.dart';
import 'login/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
                apiRepository: ApiRepository(apiService: apiService))),
        BlocProvider<ApplyCubit>(
            create: (context) =>
                ApplyCubit(apiRepository: ApiApplyRepository())),
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(apiRepository: ApiHomeRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
      ),
    );
  }
}
