import 'package:flutter/material.dart';

import '../theme.dart';

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.info_outline_rounded,
          color: ThemeColors.primary,
          size: 36,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No items found',
            style: ThemeTextStyles.headin6,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.add_task_outlined,
            size: 24.0,
          ),
          label: const Text("Add Item"),
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
