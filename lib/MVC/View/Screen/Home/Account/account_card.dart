import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/MVC/Controller/account_controller.dart';
import 'package:huanmaiw/MVC/Model/transaction_model.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();

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
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.changeTab(0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.selectedTab.value == 0 ? Colors.black : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Tài khoản',
                        style: TextStyle(
                          color: controller.selectedTab.value == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => controller.changeTab(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.selectedTab.value == 1 ? Colors.black : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Giao dịch',
                        style: TextStyle(
                          color: controller.selectedTab.value == 1 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              Obx(() => controller.selectedTab.value == 0
                  ? _buildAccountTab()
                  : _buildTransactionTab(controller.transactionHistory)),
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
                      const Text(
                        'KIEU MAI HUAN',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.person, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
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
                  const SizedBox(height: 8),
                  const Text('A826 0209 2003', style: TextStyle(color: Colors.red, fontSize: 20)),
                  const Divider(),
                  const Row(
                    children: [
                      Icon(Icons.account_balance, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('Số dư sinh lợi'),
                      Spacer(),
                      Text('VND 0', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(),
                  const Row(
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

  Widget _buildTransactionTab(List<Transaction> transactions) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lịch sử giao dịch',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          transactions.isEmpty
              ? const Center(
            child: Text(
              'Chưa có giao dịch nào.',
              style: TextStyle(color: Colors.grey),
            ),
          )
              : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(transaction.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(transaction.date),
                  trailing: Text(
                    transaction.amount,
                    style: TextStyle(
                      color: transaction.amount.startsWith('+') ? Colors.green : Colors.red,
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