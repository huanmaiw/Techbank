import 'package:flutter/material.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('VIE', style: TextStyle(fontWeight: FontWeight.bold)),
        Switch(
          value: isEnglish,
          onChanged: (value) {
            setState(() {
              isEnglish = value;
            });
          },
          activeColor: ResColor.green,
          inactiveThumbColor: ResColor.green,
          inactiveTrackColor: ResColor.white,
        ),
        const Text('ENG', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
