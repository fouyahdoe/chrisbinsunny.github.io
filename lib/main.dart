
import 'package:flutter/material.dart';
import 'package:portfolio/index.dart';
import 'package:seo/html/seo_controller.dart';
import 'package:seo/html/tree/widget_tree.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'Chrisbin Sunny - Mobile Developer | Speaker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff5dc8f8),
          secondaryHeaderColor: Color(0xff065a9d),
          scaffoldBackgroundColor: const Color(0xff0c0c0c),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>(Color(0x5455889f))
          ),
          fontFamily: "Gilroy",
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          )
        ),
        home: const Index(),
      ),
    );
  }
}


