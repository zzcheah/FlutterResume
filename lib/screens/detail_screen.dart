import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resume/data/education.dart';
import 'package:flutter_resume/widgets/widgets.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

final TextStyle titleStyle = TextStyle(
  color: Colors.blue,
  fontSize: 20.0,
  fontWeight: FontWeight.w800,
  letterSpacing: 1.2,
  decoration: TextDecoration.underline,
);

class _DetailScreenState extends State<DetailScreen>
    with AutomaticKeepAliveClientMixin<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double factor = 0.6;
    if (MediaQuery.of(context).size.width < 500) {
      factor = 1.0;
    } else if (MediaQuery.of(context).size.width <= 1024) {
      factor = 0.8;
    }

    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            widthFactor: factor,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  Text('Experience', style: titleStyle),
                  SizedBox(height: 15.0),
                  ExperienceTabs(),
                  _customDivider,
                  Text('Education', style: titleStyle),
                  SizedBox(height: 15.0),
                  _EducationSection(),
                  _customDivider,
                  Text('Certifications', style: titleStyle),
                  Certifications(),
                  _customDivider,
                  Text('Skills and Languages', style: titleStyle),
                  SkillChips(),
                  _customDivider,
                ]),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Responsive.isDesktop(context)
            ? Row(
                children: educations
                    .map((edu) => Expanded(
                          flex: 1,
                          child: EducationCard(
                            edu: edu,
                          ),
                        ))
                    .toList(),
              )
            : Column(
                children: educations
                    .map(
                      (edu) => EducationCard(
                        edu: edu,
                      ),
                    )
                    .toList(),
              ));
  }
}

Widget _customDivider = Container(
    child: Column(
  children: [
    SizedBox(height: 15.0),
    Divider(
      thickness: 2.0,
      color: Colors.white30,
    ),
    SizedBox(height: 15.0)
  ],
));
