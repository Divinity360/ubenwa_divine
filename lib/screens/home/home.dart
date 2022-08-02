import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/pet_provider.dart';
import 'package:ubenwa/widgets/app_loader.dart';
import 'package:ubenwa/widgets/newborn_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PetProvider? petProvider;

  @override
  void initState() {
    petProvider = Provider.of<PetProvider>(context, listen: false);
    petProvider!.getAllNewBorn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _textTheme = _appTheme.textTheme;
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: _appTheme.backgroundColor,
            appBar: AppBar(
                toolbarHeight: 80,
                flexibleSpace: const Center(
                  child: TabBar(
                    tabs: [Tab(text: 'CATS'), Tab(text: 'DOGS')],
                  ),
                )),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90, bottom: 20),
                      child: Text('Test App', style: _textTheme.headline1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Consumer<PetProvider>(
                        builder: (context, newbornProvider, child) {
                          if (newbornProvider.loading) {
                            return const AppLoader();
                          } else if (newbornProvider.newBornList != null &&
                              newbornProvider.newBornList!.isNotEmpty) {
                            return NewbornListView(
                                newbornList: newbornProvider.newBornList);
                          }
                          return Text('No newborns are available',
                              style:
                                  _textTheme.subtitle1!.copyWith(fontSize: 23));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
