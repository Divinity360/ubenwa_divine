import 'package:flutter/material.dart';
import 'package:ubenwa/models/newborns.dart';
import 'package:ubenwa/utils/colors.dart';

class NewBornCard extends StatelessWidget {
  final NewBorn newBorn;

  const NewBornCard({
    Key? key,
    required this.newBorn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _appWidth = _mediaQuery.size.width;
    final _textTheme = Theme.of(context).textTheme;
    return Container(
        width: _appWidth,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              color: AppColors.magnolia,
              width: 2,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Newborn ID : ${newBorn.id}',
                style: _textTheme.subtitle1),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text('Newborn Name : ${newBorn.attributes!.name}',
                  style: _textTheme.subtitle1),
            ),
            Text('Newborn Gender : ${newBorn.attributes!.gender}',
                style: _textTheme.subtitle1),
          ],
        ));
  }
}
