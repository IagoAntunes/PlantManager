import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../register/pages/register_page.dart';

class ButtonStart extends StatelessWidget {
  const ButtonStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.all(12),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      child: const Icon(Icons.arrow_right_outlined),
    );
  }
}
