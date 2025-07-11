import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> luanchCustomUrl(context, String? comingUrl) async {
  if (comingUrl != null) {
    Uri url = Uri.parse(comingUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot Luanch This URL"),
        ),
      );
    }
  }
}
