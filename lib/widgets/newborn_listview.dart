
import 'package:flutter/cupertino.dart';
import 'package:ubenwa/models/newborns.dart';
import 'package:ubenwa/widgets/newborn_card.dart';

class NewbornListView extends StatelessWidget {
  final List<NewBorn>? newbornList;

  const NewbornListView({Key? key, required this.newbornList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: newbornList!.length * 140,
      child: ListView.builder(
        itemCount: newbornList!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return NewBornCard(newBorn: newbornList!.elementAt(i));
        },
      ),
    );
  }
}