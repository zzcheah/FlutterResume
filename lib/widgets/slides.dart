import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/widgets/responsive.dart';

class Slides extends StatefulWidget {
  @override
  _SlidesState createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  @override
  void initState() {
    super.initState();
  }

  List<String> _sentences = [
    'Hey.',
    'There are more things that I want to share with you ...',
    'I enjoy learning new technologies.',
    'This website is built using Flutter',
    'Although Flutter for web is still in beta,',
    'I am already learning it and used it to build this online resume!',
    'Cool, right?',
    'You can check out the source code in my GitHub Repo ;)',
    'Also,',
    'I like to explore different ways of doing things',
    'For example,',
    'I learn the differences between using ReactJs and Flutter to build a web app',
    'It is important as it improves my critical thinking skill',
    'which is something that is very crucial in this fast-changing world.',
    'As someone who is passionate in learning technologies,',
    'I join events organized by the tech communities to learn from one another',
    'In 2019,',
    'I was elected by Google to be the Developer Student Club (DSC) Lead.',
    'I started to build a community in my university,',
    'I lead my club to organize various events and workshops',
    'to deliver knowledge to the community',
    'Because of this opportunity',
    'I have learnt some leadership skills by leading the club members.',
    'Lastly,',
    'If you wish to know more about me,',
    'feel free to contact me or visit my LinkedIn profile',
    'Thank you',
    'Have a nice day :)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColors.c1.withAlpha(100),
      ),
      alignment: Alignment.center,
      child: DefaultTabController(
        length: _sentences.length,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.4,
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: TabBarView(
            children: _sentences.map((e) => _Sentence(sentence: e)).toList(),
          ),
        ),
      ),
    );
  }
}

class _Sentence extends StatelessWidget {
  final String sentence;

  const _Sentence({Key key, this.sentence}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.4,
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: Center(
            child: Text(
              sentence,
              textAlign: TextAlign.center,
              textScaleFactor: Responsive.isDesktop(context) ? 1.0 : 0.7,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize:
                      min(100, max((1440 / sentence.characters.length), 20)),
                  fontWeight: Responsive.isDesktop(context)
                      ? FontWeight.w600
                      : FontWeight.w400,
                  shadows: [Shadow(color: Colors.black, blurRadius: 5.0)]),
            ),
          ),
        ),
      ),
    );
  }
}
