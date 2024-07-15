import 'package:flutter/material.dart';

class fieldsPieChart extends StatelessWidget {
  const fieldsPieChart({
    super.key,
    required this.xController,
    // required this.yController,
  });
  final TextEditingController xController;

  // final TextEditingController yController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          child: TextField(
            controller: xController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the percentage ',
            ),
          ),
        ),
        // SizedBox(
        //   width: 20,
        // ),
        // Container(
        //   width: 200,
        //   child: TextField(
        //     controller: yController,
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(),
        //       labelText: 'Enter the Y values',
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
