import 'package:app_flutter_thientin/src/home/cubit/home_cubit.dart';
import 'package:app_flutter_thientin/src/home/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        print("Login Loading");
        return const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is HomeError) {
        print("Login Error");
        return Center(
          child: Text('loi'),
        );
      } else if (state is HomeLoaded) {
        print("Login Loaded");
        return const SizedBox.shrink();
      }  
      return const HomePage();
    });
  }
  }
