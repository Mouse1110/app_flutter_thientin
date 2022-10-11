import 'package:app_flutter_thientin/src/create_campaign/cubit/create_campaign_cubit.dart';
import 'package:app_flutter_thientin/src/create_campaign/screens/validations/form_validation.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/routes_navigator.dart';
import 'screens/create_campaign_image/view.dart';
import 'screens/create_campaign_page/view.dart';

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({super.key});

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  final CreateCampaignFormValidation validation =
      CreateCampaignFormValidation();
  @override
  void initState() {
    context.read<CreateCampaignCubit>().initial = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCampaignCubit, CreateCampaignState>(
      builder: (context, state) {
        if (state is CreateCampaignLoading) {
          print('CreateCampaignLoading');
          return const Splash();
        } else if (state is CreateCampaignLoaded) {
          RouteNavigator.pushName(context, '/home');
        }
        if (state is CreateCampaignInitial) {
          print('CreateCampaignInitial');
        }
        switch (context.read<CreateCampaignCubit>().initial) {
          case 0:
            return CreateCampaignPage(validation: validation);
          case 1:
            return CreateCampaignImagePage(
              validation: validation,
            );
          default:
            return CreateCampaignPage(validation: validation);
        }
      },
    );
  }
}
