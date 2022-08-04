import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.grey.withOpacity(0.25),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Column(
              //   children: list
              //       .map((e) => Item(
              //           image: e,
              //           press: (str) {
              //             print(str);
              //             int index = list.indexWhere(
              //                 (element) => element.path == str);
              //             if (index > -1) {
              //               list.removeAt(index);
              //               setState(() {});
              //             }
              //           }))
              //       .toList(),
              // ),
              SizedBox(height: 16),
              InkWell(
                child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text(
                        'Thêm mới',
                        style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
