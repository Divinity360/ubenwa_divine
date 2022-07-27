import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/auth_provider.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/validation.dart';
import 'package:ubenwa/widgets/form_field_container.dart';
import 'package:ubenwa/widgets/primary_button.dart';
import 'package:ubenwa/widgets/primary_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _mediaQuery = MediaQuery.of(context);
    final _textTheme = _appTheme.textTheme;
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passWordController = TextEditingController();
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
                key: _signupFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text('SignUp', style: _textTheme.headline2),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            PrimaryTextField(
                              labelText: 'Name',
                              controller: _emailController,
                              validator: AppValidation.validateEmptyField,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: PrimaryTextField(
                                  labelText: 'Email',
                                  controller: _emailController,
                                  validator: AppValidation.validateEmail,
                                )),
                            PrimaryTextField(
                              labelText: 'Password',
                              isPasswordField: true,
                              controller: _passWordController,
                              validator: AppValidation.validatePassword,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 21),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      'By entering your details, your are agreeing ',
                                  style: _textTheme.headline3,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Terms of\nService',
                                        style: _textTheme.headline4),
                                    TextSpan(
                                        text: ' and ',
                                        style: _textTheme.headline3),
                                    TextSpan(
                                        text: 'Privacy Policy.',
                                        style: _textTheme.headline4),
                                    TextSpan(
                                        text: 'Thanks!',
                                        style: _textTheme.headline3),
                                  ],
                                ),
                              ),
                            ),
                            Consumer<AuthProvider>(
                                builder: (context, authProvider, child) =>
                                    PrimaryButton(
                                      labelText: 'Sign Up',
                                      loading: authProvider.loading,
                                      onTap: () {
                                        if (_signupFormKey.currentState!
                                            .validate()) {
                                          authProvider.register(
                                              email: _emailController.text,
                                              password: _passWordController.text,
                                              name: _nameController.text);
                                        }
                                      },
                                    )),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, bottom: 15),
                                child: InkWell(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already have an account? ',
                                      style: _textTheme.bodyText2,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Login',
                                            style: _textTheme.subtitle2),
                                      ],
                                    ),
                                  ),
                                  onTap: () => Navigator.of(context)
                                      .pushReplacementNamed(AppRoutes.login),
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
