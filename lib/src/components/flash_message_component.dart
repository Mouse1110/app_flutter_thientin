import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlashMessage {
  static SnackBar popup(String title, String body) => SnackBar(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                  color: const Color(0xFFC72C41),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 52,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          body,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  'assets/svg/bubbles.svg',
                  height: 48,
                  width: 40,
                  color: const Color(0xFF801336),
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/fail.svg',
                    height: 48,
                    width: 40,
                    color: const Color(0xFF801336),
                  ),
                  Positioned(
                      top: 10,
                      child: SvgPicture.asset(
                        'assets/svg/close.svg',
                        height: 16,
                      ))
                ],
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
}
