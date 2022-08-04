import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemShowInfo extends StatelessWidget {
  final Widget icon;
  final String title;
  final String info;
  const ItemShowInfo({
    Key? key,
    required this.icon,
    required this.info,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                info,
                style: GoogleFonts.readexPro(fontSize: 12, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
