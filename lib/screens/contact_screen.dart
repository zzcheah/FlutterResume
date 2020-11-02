import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with AutomaticKeepAliveClientMixin<ContactScreen> {
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
        child: Center(
          child: SingleChildScrollView(
            child: FractionallySizedBox(
              widthFactor: factor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_left),
                        Text('Swipe'),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                  Slides(),
                  SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      _CustomIcon(
                        icon: MdiIcons.facebook,
                        text: 'Facebook',
                        link: 'https://www.facebook.com/zzcheah',
                      ),
                      _CustomIcon(
                        icon: MdiIcons.linkedin,
                        text: 'LinkedIn',
                        link: 'https://www.linkedin.com/in/zzcheah',
                      ),
                      _CustomIcon(
                        icon: MdiIcons.github,
                        text: 'GitHub',
                        link: 'https://github.com/zzcheah',
                      ),
                      _CustomIcon(
                        icon: MdiIcons.instagram,
                        text: 'Instagram',
                        link: 'https://www.instagram.com/zz_croconuts',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Contact(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CustomIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final String link;

  const _CustomIcon({Key key, this.icon, this.text, this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: FlatButton.icon(
        icon: Icon(
          icon,
          color: Colors.blue,
        ),
        label: Text(
          text,
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () => launch(link),
      ),
    );
  }
}
