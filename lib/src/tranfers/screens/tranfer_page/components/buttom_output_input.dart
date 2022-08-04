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
          Expanded(
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
                            color: Color.fromRGBO(14, 152, 210, 1),
                          ))),
                ),
                child: Center(
                    child: FittedBox(
                  child: Text(
                    'Nạp thêm',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )),
              ),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  )),
                ),
                child: Center(
                    child: FittedBox(
                  child: Text(
                    'Rút ra',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
