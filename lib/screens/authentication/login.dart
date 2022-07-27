import 'package:flutter/material.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/validation.dart';
import 'package:ubenwa/widgets/form_field_container.dart';
import 'package:ubenwa/widgets/primary_button.dart';
import 'package:ubenwa/widgets/primary_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _mediaQuery = MediaQuery.of(context);
    final _textTheme = _appTheme.textTheme;
    final _appWidth = _mediaQuery.size.width;
    return Scaffold(
      backgroundColor: _appTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90, bottom: 90),
                child: Text('Test App', style: _textTheme.headline1),
              ),
              FormFieldContainer(
                  child: Form(
                key: _loginFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text('Login', style: _textTheme.headline2),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const PrimaryTextField(
                              labelText: 'Email',
                              validator: AppValidation.validateEmail,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: PrimaryTextField(
                                labelText: 'Password',
                                isPasswordField: true,
                                validator: AppValidation.validatePassword,
                              ),
                            ),
                            Container(
                              width: _appWidth,
                              padding: const EdgeInsets.only(
                                  top: 8, right: 15, bottom: 35),
                              alignment: Alignment.centerRight,
                              child: Text('forgot password?',
                                  style: _textTheme.subtitle2),
                            ),
                            PrimaryButton(
                              labelText: 'Login',
                              onTap: () {
                                if (_loginFormKey.currentState!.validate()) {

                                }
                              },
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 85, bottom: 15),
                                child: InkWell(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Dont have an account? ',
                                      style: _textTheme.bodyText2,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Sign Up',
                                            style: _textTheme.subtitle2),
                                      ],
                                    ),
                                  ),
                                  onTap: () => Navigator.of(context)
                                      .pushReplacementNamed(AppRoutes.signup),
                                ))
                          ],
                        ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
