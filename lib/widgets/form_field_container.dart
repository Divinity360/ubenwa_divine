import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

class FormFieldContainer extends StatelessWidget {
  const FormFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _appWidth = _mediaQuery.size.width;
    return Container(
        width: _appWidth,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              color: AppColors.magnolia,
              width: 2,
            )),
        child: child);
  }
}
