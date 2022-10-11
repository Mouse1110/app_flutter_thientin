import 'package:app_flutter_thientin/src/campaign/cubit/campaign_cubit.dart';
import 'package:app_flutter_thientin/src/campaign/screens/view.dart';
import 'package:app_flutter_thientin/src/campaign/screens/validation/data_validation.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Campaign extends StatefulWidget {
  const Campaign({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  final CampaignDataValidation validation = CampaignDataValidation();
  @override
  void initState() {
    context.read<CampaignCubit>().fetchCampaignApi(
        context.read<LoginCubit>().user!.accessToken,
        id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignCubit, CampaignState>(
      builder: (context, state) {
        if (state is CampaignInitial) {
        } else if (state is CampaignLoading) {
          print('CampaignLoading');
        } else if (state is CampaignLoaded) {
          validation.addCampaign(state.campaign);
        } else if (state is CampaignError) {
          print('CampaignError');
        }
        return CampaignPage(validation: validation);
      },
    );
  }
}
