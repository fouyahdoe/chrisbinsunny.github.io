

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, mulBy: 0.5),
      height: screenHeight(context),
      color: const Color(0xff0c0c0c),
      constraints: const BoxConstraints(
      minWidth: 500
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Text(
                "Flutter Dart Firebase Supabase Google Cloud Maps GoLang "*30,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 80,
                    color: Color(0x83093c0)
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                width: constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/macGuy.png",
                        colorBlendMode: BlendMode.colorDodge,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,

                      child: const Text(
                        "Chrisbin",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xff5dc8f8),
                          fontSize: 70
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,

                      child: const Text(
                        "Sunny",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff065a9d),
                            fontSize: 70,
                          height: 0.8
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight(context, mulBy: 0.25),
                        width: 400,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w100,
                            color: Colors.white.withOpacity(0.7),
                            shadows: const [
                              BoxShadow(
                                blurRadius: 17.0,
                                spreadRadius: 20,
                                color: Color(0xff5dc8f8),
                              ),
                            ],
                          ),
                          child: AnimatedTextKit(

                            repeatForever: true,
                            pause: const Duration(seconds: 1),
                            animatedTexts: [
                              FlickerAnimatedText(
                                'App Developer',
                               ),
                              FlickerAnimatedText(
                                'Speaker',
                              ),
                              FlickerAnimatedText(
                                'Engineer',
                              ),
                              FlickerAnimatedText(
                                'Designer',
                              ),
                            ],
                            displayFullTextOnTap: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
