import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../cubit/login_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        color: const Color(0xffFEB800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            IconButton(
                padding: const EdgeInsets.only(left: 30),
                onPressed: () {
                  context.read<LoginCubit>().nav(0);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                )),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Text('Đăng ký',
                  style: GoogleFonts.bitter(
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              child: Expanded(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 600),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
// Họ và tên
                          TextFormField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.people_alt),
                                hintText: 'Họ và tên',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ), //people_alt
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.phone),
                                hintText: 'Số điện thoại',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.remove_red_eye),
                                hintText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove_red_eye)),
                                hintText: 'Mật khẩu',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.check),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove_red_eye)),
                                hintText: 'Nhập lại mật khẩu',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),

                          const SizedBox(
                            height: 40,
                          ),

                          ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().nav(1);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Container(
                              height: 50,
                              width: 120,
                              alignment: Alignment.center,
                              child: const Text(
                                'Đăng ký ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
