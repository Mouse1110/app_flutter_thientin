import 'package:app_flutter_thientin/src/login/cubit/login_cubit.dart';
import 'package:app_flutter_thientin/src/login/screens/signup_page/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../validation/form_validation.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  FormValidation formValidation = FormValidation();

  @override
  void dispose() {
    formValidation.dispose();
    super.dispose();
  }

  Widget _inputPhone() => Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: StreamBuilder<Object>(
            stream: formValidation.streamPhone,
            builder: (context, snapshot) {
              return TextFormField(
                keyboardType: TextInputType.number,
                onChanged: formValidation.changePhone,
                decoration: InputDecoration(
                    errorText: snapshot.hasError ? "${snapshot.error}" : null,
                    prefixIcon: const Icon(Icons.phone),
                    hintText: 'Số điện thoại',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    )),
              );
            }),
      );

  Widget _inputPass() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: StreamBuilder<Object>(
          stream: formValidation.streamPass,
          builder: (context, snapshot) {
            return StreamBuilder<Object>(
                stream: formValidation.streamVisiblePass,
                initialData: true,
                builder: (context, snapshotCheck) {
                  return TextFormField(
                    onChanged: formValidation.changePass,
                    obscureText: snapshotCheck.data as bool,
                    decoration: InputDecoration(
                        errorText:
                            snapshot.hasError ? "${snapshot.error}" : null,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Mật khẩu',
                        suffixIcon: InkWell(
                            onTap: () {
                              formValidation.changvisiblePass(
                                  !(snapshotCheck.data as bool));
                            },
                            child: const Icon(Icons.visibility)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        )),
                  );
                });
          }),
    );
  }

  Widget _submitButton({required BuildContext context}) =>
      StreamBuilder<Object>(
          stream: formValidation.streamValidateSubmit,
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed: !snapshot.hasData
                  ? null
                  : () {
                      formValidation.callSubmit(context: context);
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
                  'Đăng nhập',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            );
          });

  Widget _nextSignup({required BuildContext context}) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bạn chưa có tài khoản?',
              style: GoogleFonts.roboto(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                context.read<LoginCubit>().nav(2);
              },
              child: Text('Đăng ký',
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffFEB800))),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 40,
              spreadRadius: -12,
              color: Colors.black.withOpacity(0.25))
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          _inputPhone(),
          const SizedBox(
            height: 20,
          ),
          _inputPass(),
          const SizedBox(
            height: 30,
          ),
          _submitButton(context: context),
          _nextSignup(context: context)
        ],
      ),
    );
  }
}
