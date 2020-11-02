import 'package:flutter/material.dart';
import 'package:flutter_resume/configs/colors.dart';
import 'package:url_launcher/url_launcher.dart';

const String download_link =
    'https://drive.google.com/uc?export=download&id=12YY3poc5vmIR649QCErDRUZhQwlceTU7';

FloatingActionButton downloadButton = FloatingActionButton(
  child: Icon(
    Icons.download_rounded,
    color: primaryColors.c4.withAlpha(100),
  ),
  elevation: 10.0,
  focusElevation: 20.0,
  focusColor: primaryColors.c4,
  backgroundColor: primaryColors.c2.withAlpha(70),
  onPressed: () {
    launch(download_link);
  },
);
