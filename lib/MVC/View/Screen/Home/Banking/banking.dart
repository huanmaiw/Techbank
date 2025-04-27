import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import '../../../../Controller/transfer_controller.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferController controller = Get.put(TransferController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Từ ", style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                _buildAccountInfo(),
                const SizedBox(height: 16),
                const Text('Tới', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                _buildReceiverAccountInput(),
                const SizedBox(height: 8),
                const Text('Nhập số tiền', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                _buildAmountInput(),
                const SizedBox(height: 8),
                _buildTransactionDetails(),
                const SizedBox(height: 350),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.validatePin();
                      if (controller.isPinValid.value) {
                        controller.onTransferSuccess();
                      } else {
                        controller.onTransferError();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ResColor.green,
                      foregroundColor: ResColor.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Tiếp tục', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset("assets/logo/iconapp.png", width: 50, height: 50),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tài Khoản Thanh Toán (*-2003)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Tài khoản mặc định', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiverAccountInput() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset("assets/logo/iconapp.png", width: 50, height: 50),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tài Khoản Nhận', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text('Nhập số tài khoản nhận'), border: InputBorder.none),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(label: Text('Số tiền'), border: InputBorder.none),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return const Center(
      child: Text(
        'Số dư : 10,000,000,000 VND',
        style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
