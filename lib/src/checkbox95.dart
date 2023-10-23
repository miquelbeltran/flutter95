import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class Checkbox95 extends StatelessWidget {
  final bool value;
  final String? label;
  final ValueChanged<bool>? onChanged;
  final ValueNotifier<bool> _isChecked;
  final ValueNotifier<bool> _isTapped = ValueNotifier<bool>(false);

  bool get enabled => onChanged != null;

  static const double _checkSize = 12;

  final Widget checkedEnabledIcon = Image.asset(
    'icons/checkmark.png',
    package: 'flutter95',
    width: _checkSize,
    height: _checkSize,
  );

  final Widget checkedDisabledIcon = Image.asset(
    'icons/checkmark_disabled.png',
    package: 'flutter95',
    width: _checkSize,
    height: _checkSize,
  );

  Checkbox95({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
  }) : _isChecked = ValueNotifier<bool>(value);

  @override
  Widget build(BuildContext context) {
    final Widget checkboxWidget = Elevation95(
      type: Elevation95Type.down,
      child: ValueListenableBuilder<bool>(
        builder: (context, isTapped, child) {
          Color bgColor;
          if (enabled) {
            if (isTapped) {
              bgColor = Flutter95.background;
            } else {
              bgColor = Flutter95.white;
            }
          } else {
            bgColor = Flutter95.background;
          }

          return Container(
            color: bgColor,
            child: child,
          );
        },
        valueListenable: _isTapped,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isChecked,
          builder: (context, isChecked, child) {
            return Container(
              padding: const EdgeInsets.all(1),
              child: isChecked
                  ? enabled
                      ? checkedEnabledIcon
                      : checkedDisabledIcon
                  : const SizedBox(height: _checkSize, width: _checkSize),
            );
          },
        ),
      ),
    );

    final Widget checkboxWithOptionalLabel = (label != null)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              checkboxWidget,
              const SizedBox(width: 6),
              Text(label!, style: Flutter95.textStyle),
            ],
          )
        : checkboxWidget;

    return GestureDetector(
      onTap: () {
        if (enabled) {
          _isChecked.value = !_isChecked.value;
          onChanged?.call(_isChecked.value);
        }
      },
      onTapDown: (details) {
        _isTapped.value = true;
      },
      onTapUp: (details) {
        _isTapped.value = false;
      },
      onTapCancel: () {
        _isTapped.value = false;
      },
      child: checkboxWithOptionalLabel,
    );
  }
}
