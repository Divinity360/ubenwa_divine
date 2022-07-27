import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.labelText,
    this.onTap,
    this.loading = false,
  }) : super(key: key);

  final String labelText;
  final Function()? onTap;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _textTheme = _appTheme.textTheme;
    return loading
        ? SizedBox(
            width: 16,
            height: 16,
            child: Center(
              child: CircularProgressIndicator(
                  backgroundColor: AppColors.primaryColor),
            ),
          )
        : InkWell(
            child: Container(
              padding: const EdgeInsets.only(top: 9),
              child: Text(
                labelText,
                style: _textTheme.button,
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              height: 35,
              constraints: const BoxConstraints(minWidth: 105),
            ),
            onTap: onTap,
          );
  }
}
