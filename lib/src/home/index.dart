import 'package:app_flutter_thientin/src/error/index.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/screens/index.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchCampaignApi(
        accessToken:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNzQzYTA3ZTg5ZGNiMzM5OWVmYzMxOTZmZWRlZDhlYzkiLCJpYXQiOjE2NTk2MzA0MDcsImV4cCI6MTY1OTcxNjgwN30.unmIeeHbDMoSD0m6FpnCSRTfsAul479kcpgsD7yl5JU');
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        print("Login Loading");
        return const Splash();
      } else if (state is HomeError) {
        print("Login Error");
        return ErrorPage(
          message: state.failure.message,
        );
      } else if (state is HomeLoaded) {
        print("Login Loaded:${state.campaign.idCaimpain}");
        return HomePage(
          campaign: state.campaign,
        );
      }
      return const Splash();
    });
  }

  static Future<void> push({required BuildContext context}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Home()));
    });
  }

  static Future<void> pop({required BuildContext context}) async {
    SystemNavigator.pop();
  }
}
