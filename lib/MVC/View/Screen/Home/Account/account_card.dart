import 'package:flutter/material.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedTab = 0;
  final List<Map<String, String>> transactionHistory = [
    {
      'title': 'Nhận tiền từ KIEU MAI HUAN',
      'date': '25/04/2025',
      'amount': '+ 50,000,000,000',
    },
    {
      'title': 'Chuyển tiền đến LUU VAN DUONG',
      'date': '20/04/2025',
      'amount': '- 500,000,000',
    },
    {
      'title': 'Nhận tiền từ TRAN THU TRANG',
      'date': '19/04/2025',
      'amount': '+ 10,000,000',
    },
    {
      'title': 'Chuyển tiền đến NGUYEN MINH CHIEN',
      'date': '18/04/2025',
      'amount': '- 1,000,000,000',
    },
    {
      'title': 'Nhận tiền từ NGUYEN QUANG HUY',
      'date': '12/04/2025',
      'amount': '+ 10,000,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColor.theme,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              // Tab bar
              Container(
                color: ResColor.theme,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTab = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedTab == 0 ? Colors.black : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Tài khoản',
                        style: TextStyle(
                          color: _selectedTab == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedTab = 1; // Chuyển sang tab "Giao dịch"
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedTab == 1 ? Colors.black : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Giao dịch',
                        style: TextStyle(
                          color: _selectedTab == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _selectedTab == 0
                  ? _buildAccountTab()
                  : _buildTransactionTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'KIEU MAI HUAN',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Tài khoản thanh toán',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'VND 10,000,000,000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('A826 0209 2003', style: TextStyle(color: Colors.red,fontSize: 20)),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.account_balance, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('Số dư sinh lợi'),
                      Spacer(),
                      Text('VND 0', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.account_balance, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('Tổng số dư'),
                      Spacer(),
                      Text('VND 10,000,000,000', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Tab "Giao dịch"
  Widget _buildTransactionTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lịch sử giao dịch',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          transactionHistory.isEmpty
              ? Center(
            child: Text(
              'Chưa có giao dịch nào.',
              style: TextStyle(color: Colors.grey),
            ),
          )
              : ListView.builder(
            shrinkWrap: true, // Để ListView không chiếm toàn bộ không gian
            physics: const NeverScrollableScrollPhysics(), // Tắt cuộn riêng của ListView
            itemCount: transactionHistory.length,
            itemBuilder: (context, index) {
              final transaction = transactionHistory[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(transaction['title']!,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(transaction['date']!),
                  trailing: Text(
                    transaction['amount']!,
                    style: TextStyle(
                      color: transaction['amount']!.startsWith('+')
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
