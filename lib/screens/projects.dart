import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/projectView.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:seo/html/seo_widget.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, mulBy: 1),
      //height: screenHeight(context)-70,  ///Reducing 70 for appbar
      color: const Color(0xff0c0c0c),
      //color: Colors.green,
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: screenHeight(context) - 70,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, mulBy: 0.05),
          vertical: screenHeight(context, mulBy: 0.07)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texter(
            "Open Source Projects",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 34,
                color: Theme.of(context).secondaryHeaderColor),
          ),
          const SizedBox(
            height: 35,
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            spacing: 100,
            runSpacing: 40,
            children: const [
              ProjectItem(
                  name: "ChrisHub",
                  image: "images/chrishub.jpg",
                  projectDetails: ProjectDetails(
                    name: "ChrisHub",

                    image: "images/chrishubWeb.jpg",
                      altText: "",
                      desc: "Happier Than Ever: A Love Letter to Los Angeles is a 2021 American concert film directed by Robert Rodriguez and Patrick Osborne. It stars singer-songwriter Billie Eilish (pictured), who performs all 16 tracks from her second studio album, Happier Than Ever, at Los Angeles's Hollywood Bowl. Inspired by Who Framed Roger Rabbit (1988) and Cool World (1992), the film blends live action with animation; its animated scenes combine motion capture footage of Eilish with rotoscoping by Osborne. ",
                      github: "",
                      link: "https://chrisbinsunny.github.io/chrishub",
                  ),
              ),
              ProjectItem(
                name: "D R E A M",
                image: "images/dream.png",
                imageFit: BoxFit.contain,
                projectDetails: ProjectDetails(
                  name: "ChrisHub",

                  image: "images/chrishubWeb.jpg",
                  altText: "",
                  desc: "",
                  github: "",
                  link: "https://chrisbinsunny.github.io/chrishub",
                ),
              ),
              ProjectItem(
                name: "Flutter Talks",
                image: "images/flutterTalks.jpg",
                projectDetails: ProjectDetails(
                  name: "ChrisHub",
                  image: "images/chrishubWeb.jpg",
                  altText: "",
                  desc: "",
                  github: "",
                  link: "https://chrisbinsunny.github.io/chrishub",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem(
      {Key? key,
      required this.name,
      required this.image,
      this.imageFit = BoxFit.cover,
      required this.projectDetails})
      : super(key: key);

  final String image, name;
  final BoxFit imageFit;
  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          barrierColor: Colors.white.withOpacity(0.05),
          context: context,
          builder: (context) {
            return ProjectView(
              name: projectDetails.name,
              image: projectDetails.image,
              altText: projectDetails.altText,
              link: projectDetails.link,
              desc: projectDetails.desc,
              github: projectDetails.github,
            );
          },
        );
      },
      child: Column(
        children: [
          Container(
            width: 260,
            height: 180,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: const Color(0xff0c0c0c),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x2dffffff), spreadRadius: 3, blurRadius: 15)
                ]),
            child: Imager(
              path: image,
              altText: "Project item image which shows $image.",
              imageFit: imageFit,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Texter(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color(0xffffffff)),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}

class ProjectDetails {
  final String image, altText, desc, github, link, name;

  const ProjectDetails(
      {required this.image,
      required this.altText,
      required this.desc,
      required this.github,
        required this.name,
      required this.link});
}