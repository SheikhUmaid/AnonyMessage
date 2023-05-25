// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {
  ShimmerTile({super.key, required this.index, required this.text});
  int index;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: Get.height * .1,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Shimmer(
                  gradient: const LinearGradient(
                    begin: Alignment(-1.0, -0.5),
                    end: Alignment(1.0, 0.5),
                    colors: [
                      Colors.grey,
                      Colors.white,
                      Colors.grey
                    ], // Colors of the shimmer effect
                    stops: [0.0, 0.5, 1.0],
                  ),
                  child: Container(
                    height: Get.height * .01,
                    width: Get.width * .5,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Shimmer(
                  gradient: const LinearGradient(
                    begin: Alignment(-1.0, -0.5),
                    end: Alignment(1.0, 0.5),
                    colors: [
                      Colors.grey,
                      Colors.white,
                      Colors.grey
                    ], // Colors of the shimmer effect
                    stops: [0.0, 0.5, 1.0],
                  ),
                  child: Container(
                    height: Get.height * .01,
                    width: Get.width * .5,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
