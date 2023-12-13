import 'package:flutter/material.dart';

import '../../util/images.dart';

class Background2 extends StatelessWidget {
  const Background2({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Image.asset(
          AppImages.background2,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
