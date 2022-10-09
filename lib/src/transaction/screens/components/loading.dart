import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.white.withOpacity(0.3),
        child: ListView.builder(
          reverse: true,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
