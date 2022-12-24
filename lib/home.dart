


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/drawer.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/projects.dart';
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
  late final bool isWebMobile;
  final List<GlobalKey> keys=[
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  // _scrollListener() {
  //   Provider.of<ScrollDetail>(context, listen: false).setPos(scrollController.position.pixels);
  // }

  @override
  void initState() {
    // scrollController.addListener(_scrollListener);
    isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 70),
        child: AppBarCustom(keys: keys, scrollController: scrollController,),
      ),
      extendBodyBehindAppBar: true,
      endDrawer: CustomEndDrawer(keys: keys,),
      body: Container(
        color: const Color(0xff0c0c0c),
        width: screenWidth(context),
        child: Scrollbar(
          controller: scrollController,
          thickness: isWebMobile?3:11,
          interactive: true,
          radius: Radius.circular(isWebMobile?10:0),
          trackVisibility: false,
          thumbVisibility: false,
          child: ScrollConfiguration(
            behavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              children: [
                MainView(key: keys[0],),
                About(key: keys[1],),
                Projects(key: keys[2],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
