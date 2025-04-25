import 'package:flutter/material.dart';

class BalanceNotificationScreen extends StatefulWidget {
  const BalanceNotificationScreen({super.key});

  @override
  _BalanceNotificationScreenState createState() => _BalanceNotificationScreenState();
}

class _BalanceNotificationScreenState extends State<BalanceNotificationScreen> {
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bật thông báo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Switch(
                value: _isNotificationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _isNotificationEnabled = value;
                  });
                },
                activeColor: Colors.white, // Màu của nút tròn khi bật
                activeTrackColor: Colors.green, // Màu nền của thanh khi bật
                inactiveThumbColor: Colors.white, // Màu của nút tròn khi tắt
                inactiveTrackColor: Colors.grey.shade300, // Màu nền của thanh khi tắt
                materialTapTargetSize: MaterialTapTargetSize.padded,
                // Tùy chỉnh thêm với trackOutlineColor nếu cần
                trackOutlineColor: MaterialStateProperty.resolveWith((states) {
                  return _isNotificationEnabled ? Colors.green : Colors.grey.shade300;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}