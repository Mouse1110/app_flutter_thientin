import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/screens/view.dart';
import 'package:app_flutter_thientin/src/home/screens/validations/data_validation.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataValidation dataValidation = DataValidation();
  @override
  void initState() {
    dataValidation.addButtonCreateCampaign(
        context.read<LoginCubit>().user!.data.permission);
    context
        .read<HomeCubit>()
        .fetchCampaignApi(
            accessToken: context.read<LoginCubit>().user!.accessToken)
        .then((value) => context.read<HomeCubit>().fetchListCampaignApi(
            accessToken: context.read<LoginCubit>().user!.accessToken));
    super.initState();

    listenStream(context);
  }

  @override
  void dispose() {
    dataValidation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeInitial) {}
      if (state is HomeLoading) {
        print('HomeLoading');
      }
      if (state is HomeError) {
        print('Home Error');
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

  void listenStream(BuildContext context) => context
          .read<HomeCubit>()
          .notificationService
          .onNotificationClick
          .stream
          .listen((payload) {
        List<String> params = payload!.split('|');
        if (params.length > 1) {
          Navigator.of(context)
              .pushNamed(params[0], arguments: int.parse(params[1]));
        }
      });
}
