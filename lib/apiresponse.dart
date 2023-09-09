
import 'package:apinew/expense_data.dart';

class ApiResponse {
  final int status;
  final List<Expense> expenseList;

  ApiResponse({required this.status, required this.expenseList});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> expenseList = json['expenseList'];
    final List<Expense> expenses = expenseList
        .map((expenseJson) => Expense.fromJson(expenseJson))
        .toList();

    return ApiResponse(status: json['status'], expenseList: expenses);
  }
}
