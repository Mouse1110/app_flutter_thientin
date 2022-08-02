import 'package:app_flutter_thientin/src/home/index.dart';
import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        print("Login Loaded ${state.props}");
      }
      print("Loading");
      return const Scaffold(
        body: Center(
          child: Text('dasds'),
        ),
      );
    });
  }
}
