import 'package:app_flutter_thientin/src/apply/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../splash/index.dart';
import 'cubit/apply_cubit.dart';

class Apply extends StatelessWidget {
  const Apply({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyCubit, ApplyState>(builder: (context, state) {
      if (state is ApplyLoading) {
        print("Apply Loading");
        return const Splash();
      } else if (state is ApplyError) {
        print("Apply Error");
        return const Splash();
      } else if (state is ApplyLoaded) {
        print("Apply Loaded");
        return const Splash();
      }
      return ApplyPage();
    });
  }
}
