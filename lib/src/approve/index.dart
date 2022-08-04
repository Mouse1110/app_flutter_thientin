import 'package:flutter/material.dart';

import 'screens/approve_page/index.dart';
import 'screens/moreinfo_page/index.dart';

class Approve extends StatefulWidget {
  const Approve({super.key});

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  @override
  Widget build(BuildContext context) {
    return ApprovePage();
  }
}
