import 'package:flutter/material.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';
import 'package:ionicons/ionicons.dart';

import 'Drawer/drawer_screen.dart';
import 'Home/Account/account_card.dart';
import 'Home/Banking/banking.dart';
import 'Home/QR/scan_qr.dart';
// Màn hình cho Quét mã QR

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      backgroundColor: const Color(0xFFFFF4DD),
      body: SafeArea(
        child: Column(
          children: [
            // Phần header
            _buildHeader(context),
            // Nội dung scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildBalanceCard(),
                    _buildMainFunctions(context), // Truyền context vào
                    _buildPromoShort(),
                    _buildBottomBanners(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Icons.menu, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/logo/splash.png", height: 100, width: 100),
                const SizedBox(width: 16),
                const Column(
                  children: [
                    Text("Số dư hiện có",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    Text(
                      "10,000,000,000 VND",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    )
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildMainFunctions(BuildContext context) {
    final items = [
      {"icon": Ionicons.card, "label": "Tài khoản\n& Thẻ"},
      {"icon": Ionicons.swap_horizontal, "label": "Chuyển tiền\n& thanh toán"},
      {"icon": Ionicons.qr_code_outline, "label": "Quét mã\nQR"},
      {"icon": Ionicons.cash_outline, "label": "Rút tiền\nkhông thẻ"},
      {"icon": Ionicons.star_outline, "label": "Techcombank\nRewards"},
      {"icon": Ionicons.bar_chart_outline, "label": "Sinh lời\ntự động"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return GestureDetector(
            onTap: () {
              // Xử lý hành động khi nhấn vào từng mục
              switch (index) {
                case 0: // Tài khoản & Thẻ
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountScreen()),
                  );
                  break;
                case 1: // Chuyển tiền & thanh toán
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TransferScreen()),
                  );
                  break;
                case 2: // Quét mã QR
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QRScanScreen()),
                  );
                  break;
                default:
                  SnackbarHelper.showFeatureComingSoon(); // Các mục khác chưa được triển khai
              }
            },
            child: Column(
              children: [
                Icon(item["icon"] as IconData, size: 30),
                const SizedBox(height: 8),
                Text(
                  item["label"] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPromoShort() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
           Icon(Icons.campaign, color: Colors.red),
           SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  "Vay nhanh, chơi lễ thêm xông xênh",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Lễ này đi xa hay đi gần, vững ngân sách thì vi vu đâu cũng dễ!",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
           SizedBox(width: 8),
          IconButton(
            onPressed: SnackbarHelper.showFeatureComingSoon,
            icon:  Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBanners() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: SnackbarHelper.showFeatureComingSoon,
            child: Expanded(
              child: _buildMiniBanner(
                title: "Sinh Lời Trúng Lớn",
                image: Icons.emoji_events,
                bgColor: Colors.orange.shade100,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: SnackbarHelper.showFeatureComingSoon,
            child: Expanded(
              child: _buildMiniBanner(
                title: "Cơ hội trúng nhà, xe tiền tỷ",
                image: Icons.house_outlined,
                bgColor: Colors.blue.shade100,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBanner({
    required String title,
    required IconData image,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(image, size: 40),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text("Tìm hiểu ngay", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}