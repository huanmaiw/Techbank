import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/transfer_controller2.dart';

class TransferSuccessScreen extends StatelessWidget {
  const TransferSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferController controller = Get.put(TransferController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 50,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              top: 80,
              right: 30,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow.withOpacity(0.5),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 20,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.2),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/techcombank.png',
                          width: 100,
                          height: 30,
                          errorBuilder: (context, error, stackTrace) => const Text(
                            'TECHCOMBANK',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset("assets/logo/iconapp.png", height: 50, width: 50)
                      ],
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      final transfer = controller.transferModel.value;
                      return Text(
                        'Chuyển thành công tới\n${transfer.recipientName}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    Obx(() {
                      return Text(
                        controller.transferModel.value.amount,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    _buildTransactionDetails(),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 300,
                            child: ElevatedButton(
                              onPressed: controller.completeTransfer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                'Hoàn thành',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin chi tiết',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            final transfer = Get.find<TransferController>().transferModel.value;
            return Column(
              children: [
                _buildDetailRow('Ngân hàng', '${transfer.bankName}\n${transfer.accountNumber}'),
                const SizedBox(height: 10),
                _buildDetailRow('Nội dung', transfer.description),
                const SizedBox(height: 10),
                _buildDetailRow('Ngày thực hiện', transfer.transactionDate),
                const SizedBox(height: 10),
                _buildDetailRow('Mã giao dịch', transfer.transactionCode),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17,
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
