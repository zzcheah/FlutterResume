import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/models/Education.dart';
import 'package:flutter_resume/widgets/responsive.dart';

class EducationCard extends StatelessWidget {
  final Education edu;

  const EducationCard({Key key, this.edu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: Responsive.isDesktop(context) ? 300.0 : 200.0,
        child: Card(
          color: primaryColors.c2.withAlpha(70),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  edu.title,
                  style: TextStyle(
                    color: primaryColors.c3,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  edu.institute,
                  style: TextStyle(
                    color: primaryColors.white1,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.9,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  edu.detail,
                  style: TextStyle(
                    color: primaryColors.white2,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.9,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      edu.year,
                      style: TextStyle(
                        color: primaryColors.white1,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.9,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
