import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantmanager/features/home/store/home.store.dart';
import 'package:provider/provider.dart';

import '../widgets/bottomnavigation_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var store = Provider.of<HomeStore>(context);
    return Scaffold(
      body: Observer(builder: (context) {
        return IndexedStack(
          index: store.idBottomNav,
          children: store.screens,
        );
      }),
      bottomNavigationBar: BottomNavigationCustom(size: size),
    );
  }
}
