import 'package:cv_send/utils/colors.dart';
import 'package:cv_send/utils/text/text.dart';
import 'package:flutter/material.dart';

class OptionTitle extends StatelessWidget {
  const OptionTitle({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: XigoText.labelText(
        label: title,
        color: XigoColors.textColor,
      ),
    );
  }
}
