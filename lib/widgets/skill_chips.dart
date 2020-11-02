import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';

class SkillChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: _list
            .map((e) => Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 4.0,
                    child: RawChip(
                      label: Text(
                        e,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 10.0)
                            ]),
                      ),
                      backgroundColor: _colors[Random().nextInt(_colors.length)]
                          .withAlpha(200),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

List _list = [
  'Cloud Computing',
  'Amazon Web Service',
  'Google Cloud Platform',
  'Microservices',
  'Spring Boot',
  'Java',
  'Electronic Data Interchange (EDI)',
  'webMethods',
  'Mandarin',
  'English',
  'Bahasa Malaysia',
];

List<Color> _colors = [
  primaryColors.c1,
  primaryColors.c2,
  primaryColors.c3,
  primaryColors.c4,
  Colors.blue,
];
