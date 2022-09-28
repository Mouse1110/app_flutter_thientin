import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({
    Key? key,
    required this.ticks,
    required this.date,
    required this.timeLine,
  }) : super(key: key);
  final int ticks;
  final String date;
  final List<String> timeLine;
  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  Widget tick(bool isChecked) {
    return isChecked
        ? const Icon(
            Icons.check_circle,
            color: Colors.blue,
          )
        : const Icon(
            Icons.radio_button_unchecked,
            color: Colors.blue,
          );
  }

  Widget tick1() {
    return widget.ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return widget.ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return widget.ticks > 2 ? tick(true) : tick(false);
  }

  Widget tick4() {
    return widget.ticks > 3 ? tick(true) : tick(false);
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
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TimeCampaign(
                              text: 'Chiến dịch', date: widget.timeLine[0]),
                          TimeCampaign(
                              text: 'Ủng hộ', date: widget.timeLine[1]),
                          TimeCampaign(
                              text: 'Kiểm duyệt', date: widget.timeLine[2]),
                          TimeCampaign(
                              text: 'Giải ngân', date: widget.timeLine[3]),
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
                SizedBox(
                  width: 100,
                  child: Text(
                    widget.date,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromRGBO(35, 45, 94, 1)
                            .withOpacity(0.5)),
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
