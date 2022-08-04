import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemAction extends StatelessWidget {
  final Function press;
  final IconData icon;
  final String title;
  const ItemAction({
    Key? key,
    required this.press,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            press();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  size: 25.0,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
