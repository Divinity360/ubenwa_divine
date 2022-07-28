import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/models/newborns.dart';
import 'package:ubenwa/providers/newborn_provider.dart';
import 'package:ubenwa/widgets/app_loader.dart';
import 'package:ubenwa/widgets/newborn_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewBornProvider? newbornProvider;

  @override
  void initState() {
    newbornProvider = Provider.of<NewBornProvider>(context, listen: false);
    newbornProvider!.getAllNewBorn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _textTheme = _appTheme.textTheme;
    return Scaffold(
      backgroundColor: _appTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90, bottom: 20),
                child: Text('Test App', style: _textTheme.headline1),
              ),
              Switch(
                value: true,
                onChanged: (value) {
                  // setState(() {
                  //   _switchValue = value;
                  // });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Consumer<NewBornProvider>(
                  builder: (context, newbornProvider, child) {
                    if (newbornProvider.loading) {
                      return const AppLoader();
                    } else if (newbornProvider.newBornList != null) {
                      return NewbornListView(
                          newbornList: newbornProvider.newBornList);
                    }
                    return Text('No newborns are available',
                        style: _textTheme.subtitle1!.copyWith(fontSize: 23));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewbornListView extends StatelessWidget {
  final List<NewBorn>? newbornList;

  const NewbornListView({Key? key, required this.newbornList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: newbornList!.length * 200, child: ListView.builder(
        itemCount: newbornList!.length,
        itemBuilder: (context, i) {
          return NewBornCard(newBorn: newbornList!.elementAt(i));
        },
      ),);
  }
}
