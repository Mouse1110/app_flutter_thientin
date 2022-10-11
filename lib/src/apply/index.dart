import 'package:app_flutter_thientin/src/apply/screens/validations/form_validation.dart';
import 'package:app_flutter_thientin/src/apply/screens/view.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/cubit/login_cubit.dart';
import '../splash/index.dart';
import 'cubit/apply_cubit.dart';

class Apply extends StatefulWidget {
  const Apply({
    Key? key,
    required this.data,
  }) : super(key: key);
  final CampaignModel data;
  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  final ApplyFormValidation validation = ApplyFormValidation();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyCubit, ApplyState>(builder: (context, state) {
      if (state is ApplyInitial) {
        validation.addCheckList(widget.data);
      } else if (state is ApplyLoading) {
        print("Apply Loading");
        return const Splash();
      } else if (state is ApplyLoadedFile) {
        context.read<ApplyCubit>().fetchApplyApi(
            context.read<LoginCubit>().user!.accessToken,
            data: validation.geneData(state.data),
            campaignId: widget.data.idCaimpain);
        return const Splash();
      } else if (state is ApplyError) {
        print("Apply Error");
        RouteNavigator.pushName(context, '/campaign',
            arguments: '${widget.data.idCaimpain}');
      } else if (state is ApplyLoaded) {
        print("Apply Loaded");
        RouteNavigator.pushName(context, '/campaign',
            arguments: '${widget.data.idCaimpain}');
      }
      return ApplyPage(validation: validation);
    });
  }
}
