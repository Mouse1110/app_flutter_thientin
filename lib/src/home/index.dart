import 'package:app_flutter_thientin/src/error/index.dart';
import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/screens/index.dart';
import 'package:app_flutter_thientin/src/home/screens/validations/data_validation.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

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

class _HomeState extends State<Home> {
  DataValidation dataValidation = DataValidation();
  @override
  void initState() {
    context
        .read<HomeCubit>()
        .fetchCampaignApi(
            accessToken: context.read<LoginCubit>().user!.accessToken)
        .then((value) => context.read<HomeCubit>().fetchListCampaignApi(
            accessToken: context.read<LoginCubit>().user!.accessToken));
    super.initState();
  }

  @override
  void dispose() {
    dataValidation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeError) {
        print('Home Error');
        ErrorPage.push(context: context, error: state.failure.message);
      } else if (state is HomeLoadedCampaign) {
        print("HomeLoadedCampaign");
        dataValidation.addCampaign(state.campaign);
      } else if (state is HomeLoadedListCampaign) {
        print("HomeLoadedListCampaign");
        dataValidation.addListCampaign(state.listCampaign);
      }
      return HomePage(
        validation: dataValidation,
      );
    });
  }
}
