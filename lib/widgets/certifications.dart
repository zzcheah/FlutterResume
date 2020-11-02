import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/widgets/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Certifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Responsive.isDesktop(context)
            ? ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 300.0,
                    maxWidth: 0.9 * MediaQuery.of(context).size.width),
                child: Row(
                  children: [
                    Flexible(child: _gcpCert),
                    Expanded(child: _Qwiklabs())
                  ],
                ),
              )
            : ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: 800.0,
                    maxWidth: 0.9 * MediaQuery.of(context).size.width),
                child: Column(children: [
                  Expanded(child: _gcpCert),
                  Expanded(child: _Qwiklabs()),
                ])));
  }
}

Widget _gcpCert = Material(
  elevation: 4.0,
  child: FlatButton(
    child: Container(
      padding: const EdgeInsets.all(10.0),
      child: ColorFiltered(
        child: Image(image: AssetImage('assets/gcp.png')),
        colorFilter: ColorFilter.mode(
          primaryColors.background.withAlpha(100),
          BlendMode.darken,
        ),
      ),
    ),
    onPressed: () => launch(
        'https://www.coursera.org/account/accomplishments/specialization/certificate/NUFS5V5FD53R'),
  ),
);

class _Qwiklabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<Widget>> _badges = [[], [], [], []];
    for (int i = 0; i < 16; i++) {
      _badges[i % _badges.length].add(Expanded(
        child: Image(image: AssetImage('assets/qwiklabs/$i.png')),
      ));
    }

    List<Column> _columns = _badges
        .map((e) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: e,
            ))
        .toList();

    return Material(
      elevation: 4.0,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        onPressed: () => launch(
            'https://www.qwiklabs.com/public_profiles/5fbce26b-a5f3-4c72-832e-3df5bab071ee'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _columns,
        ),
      ),
    );
  }
}
// SizedBox(
//         height: 0.4 * MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width *
//             (Responsive.isDesktop(context) ? 0.5 : 1.0),
//         child: GridView.count(
//           crossAxisCount: 3,
//           // Generate 100 widgets that display their index in the List.
//           children: List.generate(16, (index) {
//             return Center(
//               child: Image(image: AssetImage('qwiklabs/$index.png')),
//             );
//           }),
//         ),
//       ),
