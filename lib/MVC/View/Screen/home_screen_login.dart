import 'package:flutter/material.dart';

class HomeScreenLogin extends StatelessWidget {
  const HomeScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
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
                      // Số dư tài khoản
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số dư hiện có',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '45,359',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Tiêu đề và mô tả
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cơ hội trúng lớn trong năm',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Căn hộ cao cấp, xe hơi cùng nhiều phần quà trị giá hàng tỷ đồng đang tìm chủ sở hữu',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Tìm hiểu ngay'),
                            ),
                          ],
                        ),
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
                    _buildMenuItem(Icons.account_balance_wallet, 'Tài khoản & Thẻ'),
                    _buildMenuItem(Icons.swap_horiz, 'Chuyển tiền chuyển toán'),
                    _buildMenuItem(Icons.qr_code, 'Quét mã QR'),
                    _buildMenuItem(Icons.money_off, 'Rút tiền không thẻ'),
                    _buildMenuItem(Icons.explore, 'Khám phá sản phẩm'),
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

            // Banner quảng cáo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sinh lợi trúng lớn đây rồi',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Cập nhật Techcombank Mobile lên phiên bản mới nhất để tham gia săn thưởng trúng quà...',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Thông báo'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Banner thứ hai
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sinh lợi từ đồng đã hấp dẫn, thêm cơ hội trúng nhà, trúng xe tiện ty',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Năng cấp ngay'),
                    ),
                  ],
                ),
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
}