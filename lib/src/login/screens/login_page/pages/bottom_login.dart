import 'package:flutter/material.dart';

class BottomLogin extends StatefulWidget {
  const BottomLogin({Key? key}) : super(key: key);

  @override
  State<BottomLogin> createState() => _BottomLoginState();
}

class _BottomLoginState extends State<BottomLogin> {
  Widget _textField({required String hintText}) => Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              )),
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
          _textField(hintText: 'Số điện thoại'),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
