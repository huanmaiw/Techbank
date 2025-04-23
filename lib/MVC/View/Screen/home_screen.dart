import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header với lời chào
            Stack(
              children: [
                // Hình nền (giả lập bằng Container, bạn có thể dùng Image.asset)
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[200]!, Colors.blue[400]!],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Lời chào
                      const Text(
                        'Chào buổi tối,',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const Text(
                        'NGUYEN VAN HUAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Nút Đăng nhập
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Đăng nhập'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Menu chức năng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem(Icons.account_balance_wallet, 'Tài khoản'),
                    _buildMenuItem(Icons.swap_horiz, 'Chuyển tiền'),
                    _buildMenuItem(Icons.qr_code, 'Quét mã QR'),
                    _buildMenuItem(Icons.money_off, 'Rút tiền'),
                    _buildMenuItem(Icons.explore, 'Khám phá'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Techcombank Rewards và Sinh lợi từ đồng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRewardItem(Icons.star, 'Techcombank Rewards'),
                  _buildRewardItem(Icons.favorite, 'Sinh lợi từ đồng'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Danh sách tùy chọn
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildOptionItem(Icons.book, 'Hướng dẫn sử dụng'),
                  _buildOptionItem(Icons.security, 'Hướng dẫn bảo mật'),
                  _buildOptionItem(Icons.phone, 'Liên hệ'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildRewardItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.red),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildOptionItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }


}