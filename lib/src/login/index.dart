import 'package:app_flutter_thientin/src/home/screens/index.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final BlocNavigator blocNavigator = BlocNavigator();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoginLoading) {
        print("Login Loading");
        return const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is LoginError) {
        print("Login Error");
        return Center(
          child: Text(state.failure.message),
        );
      } else if (state is LoginLoaded) {
        print("Login Loaded");
        return const SizedBox.shrink();
      } else if (state is LoginNav) {
        print("Login Nav");
        return state.page;
      }
      return const SizedBox.shrink();
    });
  }
}
