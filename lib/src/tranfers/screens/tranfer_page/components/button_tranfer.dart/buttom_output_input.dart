import 'package:app_flutter_thientin/src/tranfers/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class InputOutputButtom extends StatelessWidget {
  const InputOutputButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _button(() {}, 'Nạp thêm', colorButton),
          SizedBox(width: 30),
          _button(() {}, 'Rút ra', colorButton),
        ],
      ),
    );
  }

  Widget _button(Function press, String text, Color color) => Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // transfersController!.getTransfer();
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      side: BorderSide(
                        color: color,
                      ))),
            ),
            child: Center(
                child: FittedBox(
              child: Text(
                text,
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            )),
          ),
        ),
      );
}
