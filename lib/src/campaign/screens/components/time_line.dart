import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class timeline extends StatefulWidget {
  const timeline({Key? key}) : super(key: key);

  @override
  State<timeline> createState() => _timelineState();
}

class _timelineState extends State<timeline> {
  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            color: Colors.blue,
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.blue,
          );
  }
  int ticks = 0;
  Widget tick1() {
    return ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return ticks > 3 ? tick(true) : tick(false);
  }

  Widget line() {
    return Container(
      color: Colors.blue,
      height: 5.0,
      width: 30,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
children: [
   Align(
          alignment: Alignment.centerLeft,
          child: Text('Thời gian hoạt động',
              style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TimeCampaign(text: 'Chiến dịch', date: 'Ngày'),
                            TimeCampaign(text: 'Ủng hộ', date: ' Ngày'),
                            TimeCampaign(text: 'Kiểm duyệt', date: 'Ngày'),
                            TimeCampaign(text: 'Giải ngân', date: 'Ngày'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            tick1(),
                            line(),
                            tick2(),
                            line(),
                            tick3(),
                            line(),
                            tick4(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  child: Text(
                    'data ngày',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.raleway(
                        fontSize: 14,
                        color: Color.fromRGBO(35, 45, 94, 1).withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
],
    );
  }
}
class TimeCampaign extends StatelessWidget {
  final String text;
  final String date;
  const TimeCampaign({Key? key, required this.text, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: GoogleFonts.raleway(
            fontSize: 10,
            color: Color.fromRGBO(35, 45, 94, 1).withOpacity(0.75),
          ),
        ),
        Text(
          date,
          style: GoogleFonts.raleway(
            fontSize: 8,
            color: Color.fromRGBO(35, 45, 94, 1).withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
