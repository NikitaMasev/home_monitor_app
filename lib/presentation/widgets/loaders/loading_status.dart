import 'package:flutter/material.dart';

class LoadingStatus extends StatelessWidget {
  const LoadingStatus({
    required this.text,
    super.key,
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              text,
              style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      );
}
