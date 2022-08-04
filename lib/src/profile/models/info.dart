import 'package:flutter/material.dart';

class InfoItem {
  final IconData icon;
  final String title;
  final Function press;
  InfoItem({required this.icon, required this.press, required this.title});
}
