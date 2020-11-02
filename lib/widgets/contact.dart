import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      constraints: BoxConstraints(maxWidth: 600),
      child: Column(
        children: [
          Text(
            'Get in touch',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                color: primaryColors.c3.withAlpha(220)),
          ),
          SizedBox(height: 20.0),
          Text(
            'Currently I am not looking for any opportunities as I am working on my final year project. ' +
                'However feel free to send me an email if you have any questions, or just to say hi :)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, color: primaryColors.white2),
          ),
          SizedBox(height: 20.0),
          RaisedButton.icon(
            onPressed: () =>
                launch('mailto:zzcheah@live.com?subject=Hello&body=SayHi'),
            icon: Icon(Icons.email),
            label: Text('Say Hello'),
          )
        ],
      ),
    );
  }
}
