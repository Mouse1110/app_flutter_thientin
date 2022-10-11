import 'package:app_flutter_thientin/src/approve/cubit/approve_cubit.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/routes/routes_navigator.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/approve_page/index.dart';
import 'screens/info_page/info_page.dart';
import 'screens/validation/data_validation.dart';

class Approve extends StatefulWidget {
  const Approve({super.key, required this.id});
  final int id;

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  final ApproveDataValidation validation = ApproveDataValidation();
  @override
  void initState() {
    context.read<ApproveCubit>().initial = 0;
    print(widget.id);
    validation.addId('${widget.id}');
    context
        .read<ApproveCubit>()
        .fetchListFormApi(context.read<LoginCubit>().user!.accessToken,
            id: widget.id)
        .then((value) => context.read<ApproveCubit>().fetchListFormExistApi(
            context.read<LoginCubit>().user!.accessToken,
            id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApproveCubit, ApproveState>(
      builder: (context, state) {
        if (state is ApproveInitial) {
          print('ApproveInitial');
        } else if (state is ApproveLoading) {
          print('ApproveLoading');
          return const Splash();
        } else if (state is ApproveError) {
        } else if (state is ApproveLoaded) {
          validation.addForms(state.datas);
        } else if (state is ApproveLoadedExist) {
          validation.addFormExist(state.datas);
        } else if (state is ApproveLoadedDisbur) {
          RouteNavigator.pushName(context, '/campaign',
              arguments: '${widget.id}');
        }
        switch (context.read<ApproveCubit>().initial) {
          case 0:
            return ApprovePage(
              validation: validation,
            );
          case 1:
            return ApproveInfoPage(
              validation: validation,
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
