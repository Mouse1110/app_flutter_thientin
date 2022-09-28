import 'package:flutter/material.dart';

import '../../constants/font_constant.dart';

class ItemDonate extends StatelessWidget {
  const ItemDonate({
    Key? key,
    required this.name,
    required this.phone,
    required this.wallet,
  }) : super(key: key);
  final String name;
  final String phone;
  final String wallet;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: fontTitle,
                  ),
                  Text(
                    phone,
                    style: fontHint,
                  ),
                ],
              ),
            ),
            Text(
              wallet,
              style: fontTitle,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}
