import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/auth_provider.dart';
import 'package:ubenwa/utils/routes.dart';
import 'package:ubenwa/utils/validation.dart';
import 'package:ubenwa/widgets/form_field_container.dart';
import 'package:ubenwa/widgets/primary_button.dart';
import 'package:ubenwa/widgets/primary_textfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _mediaQuery = MediaQuery.of(context);
    final _textTheme = _appTheme.textTheme;
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

            ],
          ),
        ),
      ),
    );
  }
}
