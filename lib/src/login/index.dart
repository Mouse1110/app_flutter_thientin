import 'package:app_flutter_thientin/src/components/flash_message_component.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/login/screens/index_page/index.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/routes_navigator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoginLoading) {
        print("Login Loading");
        return const Splash();
      } else if (state is LoginError) {
        print("Login Error");
      } else if (state is LoginLoaded) {
        print("Login Loaded");
        RouteNavigator.pushName(context, '/home');
      } else if (state is LoginNav) {
        print("Login Nav");
        return state.page;
      }
      return const IndexLoginPage();
    });
  }
}
