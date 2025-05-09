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
        const Text(
          'VIE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8), // Thêm khoảng cách giữa Text và Switch
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Switch(
            value: isEnglish,
            onChanged: (value) {
              setState(() {
                isEnglish = value;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: ResColor.green,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.green,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              return isEnglish ? ResColor.green : ResColor.white;
            }),
          ),
        ),
        const SizedBox(width: 8), // Thêm khoảng cách giữa Switch và Text
        const Text(
          'ENG',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}