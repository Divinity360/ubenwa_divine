import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubenwa/utils/colors.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    Key? key,
    this.validator,
    this.controller,
    this.isPasswordField = false,
    required this.labelText,
  }) : super(key: key);


  final String? Function(String?)? validator;
  final String labelText;
  final bool isPasswordField;
  final TextEditingController? controller;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  /// Holds password visibility state
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _textTheme = _appTheme.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Text field label
        Padding(
          padding: const EdgeInsets.only(bottom: 2, left: 10),
          child: Text(widget.labelText, style: _textTheme.subtitle1),
        ),

        /// Round corner text field
        TextFormField(
          obscureText: _isPasswordObscure,
          obscuringCharacter: '●',
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )),
            filled: true,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
            fillColor: AppColors.greyLight.withOpacity(0.5),
            suffixIcon: widget.isPasswordField
                ? InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SvgPicture.asset(
                        'assets/eyeicon.svg',
                        height: 23,
                        color: !_passwordVisible ? AppColors.grey : null,
                      ),
                    ),
                    onTap: () {
                      setState(() => _passwordVisible = !_passwordVisible);
                    },
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(maxHeight: 30),
          ),
          style: _isPasswordObscure
              ? _textTheme.bodyText1!.copyWith(letterSpacing: 3)
              : _textTheme.bodyText1,
          validator: widget.validator,
        )
      ],
    );
  }

  bool get _isPasswordObscure => widget.isPasswordField && !_passwordVisible;
}
