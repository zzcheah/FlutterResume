import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/widgets/download_button.dart';

class Intro extends StatelessWidget {
  final bool isDesktop;

  const Intro({Key key, this.isDesktop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double padding = isDesktop ? 25.0 : 15.0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height < 700 ? 20.0 : 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 4.0,
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/avatar.jpg'),
                  fit: BoxFit.cover,
                  width: 120.0,
                  height: 120.0,
                ),
              ),
              downloadButton,
            ],
          ),
          SizedBox(
            height: padding,
          ),
          Text(
            'Hello, my name is',
            style: TextStyle(
              color: primaryColors.c3,
              fontSize: textTheme.headline6.fontSize,
            ),
          ),
          SizedBox(
            height: padding,
          ),
          Text(
            'Cheah Zhong Zhi.',
            style: TextStyle(
              color: primaryColors.white1,
              fontSize: textTheme.headline3.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: padding,
          ),
          Text(
            'I love learning new technologies.',
            style: TextStyle(
              color: primaryColors.white2,
              fontSize: textTheme.headline4.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: padding,
          ),
          Text(
            'My background in Computer Science with a specialization in Intelligent Systems.' +
                ' I am passionate in learning new technologies. ' +
                'Currently working on my final year project',
            style: TextStyle(
              color: primaryColors.white3,
              fontSize: textTheme.headline6.fontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: padding,
          ),
        ],
      ),
    );
  }
}
