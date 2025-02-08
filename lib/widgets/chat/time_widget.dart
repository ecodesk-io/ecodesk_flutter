import 'package:flutter/material.dart';
import 'package:ecodesk_flutter/models/models.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.userSent,
    required this.msg,
    required this.isVisible,
    this.textStyle,
  });

  final bool userSent;
  final EcodeskMessage msg;
  final bool isVisible;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0, left: 4, right: 4),
        child: Text(
          TimeOfDay.fromDateTime(msg.createdAt!).format(context),
          style: textStyle ??
              TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color
                    ?.withAlpha(100),
                fontSize: 10,
              ),
        ),
      ),
    );
  }
}
