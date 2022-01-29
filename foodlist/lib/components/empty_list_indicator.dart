import 'package:flutter/material.dart';

import '../theme.dart';

class EmptyListIndicator extends StatelessWidget {
  final String title;
  final String? buttontext;
  final IconData buttonIcon;
  final Function? onButtonPressed;
  const EmptyListIndicator(
      {Key? key,
      required this.title,
      this.buttontext,
      this.buttonIcon = Icons.add_task_outlined,
      this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasButton = buttontext != null && onButtonPressed != null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.info_outline_rounded,
          color: ThemeColors.primary,
          size: 36,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: ThemeTextStyles.headin6,
          ),
        ),
        if (hasButton)
          ElevatedButton.icon(
            onPressed: () {
              onButtonPressed!();
            },
            icon: Icon(
              buttonIcon,
              size: 24.0,
            ),
            label: Text(buttontext!),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              primary: ThemeColors.primary,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
      ],
    );
  }
}
