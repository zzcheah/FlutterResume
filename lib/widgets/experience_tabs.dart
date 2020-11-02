import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/data/experience.dart';

import 'responsive.dart';

class ExperienceTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: experienceList.length,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: primaryColors.c1.withAlpha(70),
        ),
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                tabs: experienceList
                    .map((e) => Tab(child: Text(e['organization'])))
                    .toList()),
            SizedBox(height: 10.0),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 220.0),
              child: TabBarView(
                children: experienceList.map((e) => _TabInfo(exp: e)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TabInfo extends StatelessWidget {
  final Map exp;

  const _TabInfo({Key key, this.exp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 12.00,
        color: primaryColors.white2,
        fontWeight: FontWeight.w300);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: Responsive.isDesktop(context) ? 10.0 : 5.0),
      child: SingleChildScrollView(
        child: Row(
          children: [
            MediaQuery.of(context).size.width > 700
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Material(
                      elevation: 4.0,
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: Ink.image(
                        image: AssetImage(exp['url']),
                        fit: BoxFit.cover,
                        width: 120.0,
                        height: 120.0,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp['title'],
                    style: TextStyle(
                        fontSize: 18.00,
                        color: primaryColors.c4.withAlpha(220),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Icon(Icons.map, color: primaryColors.white2),
                      SizedBox(width: 10.0),
                      Text(exp['location'], style: style),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.timeline, color: primaryColors.white2),
                      SizedBox(width: 10.0),
                      Text(exp['year'], style: style),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.timelapse, color: primaryColors.white2),
                      SizedBox(width: 10.0),
                      Text(exp['duration'], style: style),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
