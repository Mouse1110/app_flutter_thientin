import 'package:app_flutter_thientin/src/apply/cubit/apply_cubit.dart';
import 'package:app_flutter_thientin/src/campaign/cubit/campaign_cubit.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/login/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/apply/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/routes/routes_generator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(apiRepository: ApiRepository())),
        BlocProvider<ApplyCubit>(
            create: (context) =>
                ApplyCubit(apiRepository: ApiApplyRepository())),
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(apiRepository: ApiHomeRepository())),
        BlocProvider<CampaignCubit>(create: (context) => CampaignCubit())
      ],
      child: MaterialApp(
        title: 'Thiện Tín',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        onGenerateRoute: RoutesGenerator.generateRoute,
      ),
    );
  }
}
