


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/mainView.dart';
import '../sizes.dart';

import 'components/appBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final ScrollController scrollController= ScrollController();

  _scrollListener() {
    Provider.of<ScrollDetail>(context, listen: false).setPos(scrollController.position.pixels);
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 70),
        child: AppBarCustom(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: const Color(0xff0c0c0c),
        width: screenWidth(context),
        child: Scrollbar(
          controller: scrollController,
          thickness: 11,
          interactive: true,
          radius: const Radius.circular(0),
          trackVisibility: false,
          thumbVisibility: true,
          child: ScrollConfiguration(
            behavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              controller: scrollController,
              children: const [
                MainView(),
                MainView(),
                MainView(),
                MainView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
