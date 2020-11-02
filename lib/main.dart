import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:flutter_resume/widgets/responsive.dart';
import 'screens/screens.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheah Zhong Zhi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        canvasColor: primaryColors.background,
        primaryColor: primaryColors.c1,
        secondaryHeaderColor: primaryColors.c2,
        accentColor: primaryColors.c3,
        indicatorColor: Colors.blue,
      ),
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _screens = [
    HomeScreen(),
    DetailScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: _screens,
        ),
        bottomNavigationBar: FractionallySizedBox(
          widthFactor: Responsive.isDesktop(context) ? 0.6 : 1.0,
          child: Container(
            color: theme.canvasColor,
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: SizedBox(
              height: 30.0,
              child: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.home, size: 20.0)),
                    Tab(icon: Icon(Icons.note, size: 20.0)),
                    Tab(icon: Icon(Icons.person, size: 20.0)),
                  ],
                  indicator: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: primaryColors.c4,
                    ),
                  ),
                  unselectedLabelColor: theme.disabledColor,
                  labelColor: theme.indicatorColor),
            ),
          ),
        ),
      ),
    );
  }
}
