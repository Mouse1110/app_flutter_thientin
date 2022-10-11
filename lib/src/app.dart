import 'package:app_flutter_thientin/src/apply/cubit/apply_cubit.dart';
import 'package:app_flutter_thientin/src/approve/cubit/approve_cubit.dart';
import 'package:app_flutter_thientin/src/campaign/cubit/campaign_cubit.dart';
import 'package:app_flutter_thientin/src/create_campaign/cubit/create_campaign_cubit.dart';
import 'package:app_flutter_thientin/src/donate/cubit/donate_cubit.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/login/repository/api_repository.dart';
import 'package:app_flutter_thientin/src/proof/cubit/proof_cubit.dart';
import 'package:app_flutter_thientin/src/routes/routes_generator.dart';
import 'package:app_flutter_thientin/src/transaction/cubit/transaction_cubit.dart';
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
        BlocProvider<ApplyCubit>(create: (context) => ApplyCubit()),
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()..initNotification()),
        BlocProvider<CampaignCubit>(create: (context) => CampaignCubit()),
        BlocProvider<TransactionCubit>(create: (context) => TransactionCubit()),
        BlocProvider<ProofCubit>(create: (context) => ProofCubit()),
        BlocProvider<DonateCubit>(create: (context) => DonateCubit()),
        BlocProvider<CreateCampaignCubit>(
            create: (context) => CreateCampaignCubit()),
        BlocProvider<ApproveCubit>(create: (context) => ApproveCubit()),
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
