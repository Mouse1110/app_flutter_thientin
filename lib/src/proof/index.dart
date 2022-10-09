import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:app_flutter_thientin/src/proof/cubit/proof_cubit.dart';
import 'package:app_flutter_thientin/src/proof/screens/validation/data_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../splash/index.dart';
import 'screens/view.dart';

class Proof extends StatefulWidget {
  const Proof({Key? key, required this.data}) : super(key: key);
  final CampaignModel data;
  @override
  State<Proof> createState() => _ProofState();
}

class _ProofState extends State<Proof> {
  final ProofDataValidation validation = ProofDataValidation();
  @override
  Widget build(BuildContext context) {
    validation.addCampaign(widget.data);
    return BlocBuilder<ProofCubit, ProofState>(builder: (context, state) {
      if (state is ProofLoading) {
        print("ProofLoading");
        return const Splash();
      } else if (state is ProofLoaded) {
        print("ProofLoaded");
      }
      return ProofPage(
        validation: validation,
      );
    });
  }
}
