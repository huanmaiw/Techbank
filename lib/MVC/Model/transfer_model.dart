// lib/MVC/Model/transfer_model.dart

class TransferModel {
  final String bankName;
  final String accountNumber;
  final String description;
  final String transactionDate;
  final String transactionCode;
  final String amount;
  final String recipientName;

  TransferModel({
    required this.bankName,
    required this.accountNumber,
    required this.description,
    required this.transactionDate,
    required this.transactionCode,
    required this.amount,
    required this.recipientName,
  });
}
