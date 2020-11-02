import 'package:flutter/material.dart';
import 'package:flutter_resume/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // ThemeData theme = Theme.of(context);

    return Container(
      // color: Colors.blue,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Responsive(
              mobile: _MobileHome(),
              desktop: _DesktopHome(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _MobileHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Intro(isDesktop: true),
    );
  }
}

class _DesktopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Intro(isDesktop: true),
      ),
    );
  }
}
