import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';
import 'package:ionicons/ionicons.dart';
import 'Drawer/drawer_screen.dart';
import 'Home/Account/account_card.dart';
import 'Home/Banking/banking.dart';
import 'Home/QR/scan_qr.dart';

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
                    _buildMainFunctions(context),
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
                //Image.asset("assets/logo/iconapp.png", height: 100, width: 100,),
                Image.asset("assets/logo/splash.png", height: 90, width: 90),
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
              switch (index) {
                case 0: // Tài khoản & Thẻ
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountScreen()),
                  );
                  break;
                case 1:
                  Get.bottomSheet(
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Handle and Title
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Chuyển khoản qua số tài khoản',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Options
                          ListTile(
                            leading: const Icon(
                              Icons.supervisor_account_sharp,
                              color: Colors.blueAccent,
                              size: 40,
                            ),
                            title: const Text(
                              'Giao dịch giữa các tài khoản Techcombank',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: () {
                              Get.offAll(()=> const TransferScreen());
                            },
                            tileColor: Colors.grey.shade50,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          ),
                          const Divider(height: 1, thickness: 1, color: Colors.grey),
                          ListTile(
                            leading: const Icon(
                              Icons.account_balance,
                              color: Colors.orangeAccent,
                              size: 40,
                            ),
                            title: const Text(
                              'Giao dịch qua các ngân hàng khác',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: () {
                              SnackbarHelper.showFeatureComingSoon();
                            },
                            tileColor: Colors.grey.shade50,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    isScrollControlled: true,
                    enableDrag: true,
                    isDismissible: true,
                  );
                  break;
                case 2: // Quét mã QR
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRScanScreen()),
                  );
                  break;
                default:
                  SnackbarHelper.showFeatureComingSoon();
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
              children: [
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
            icon: Icon(Icons.chevron_right),
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
