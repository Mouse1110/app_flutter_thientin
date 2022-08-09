import 'package:app_flutter_thientin/src/error/index.dart';
import 'package:app_flutter_thientin/src/home/index.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/login/screens/index_page/index.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static Future<void> push({required BuildContext context}) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  static Future<void> pop({required BuildContext context}) async {
    SystemNavigator.pop();
  }

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
        ErrorPage.push(context: context, error: state.failure.message);
        return const SizedBox.shrink();
      } else if (state is LoginLoaded) {
        print("Login Loaded");
        Home.push(context: context);
        return const SizedBox.shrink();
      } else if (state is LoginNav) {
        print("Login Nav");
        return state.page;
      }
      return const IndexLoginPage();
    });
  }
}
