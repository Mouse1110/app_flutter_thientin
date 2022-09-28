import 'package:app_flutter_thientin/src/campaign/cubit/campaign_cubit.dart';
import 'package:app_flutter_thientin/src/campaign/screens/index.dart';
import 'package:app_flutter_thientin/src/campaign/screens/validation/data_validation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/models/campaign_model.dart';

class Campaign extends StatefulWidget {
  const Campaign({Key? key, required this.campaign}) : super(key: key);
  final CampaignModel campaign;

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  final CampaignDataValidation validation = CampaignDataValidation();
  @override
  void initState() {
    validation.addCampaign(widget.campaign);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignCubit, CampaignState>(
      builder: (context, state) {
        if (state is CampaignLoaded) {
          validation.addCampaign(state.campaign);
        } else if (state is CampaignFailer) {
          Navigator.of(context).pushNamed("/home");
        }
        return CampaignPage(validation: validation);
      },
    );
  }
}
