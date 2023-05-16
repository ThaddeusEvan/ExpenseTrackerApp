import 'package:expense_tracker/models/expense_data.dart';
import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expense,
  });

  final List<ExpenseData> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: ((context, index) => ExpenseItem(expense[index])),
    );
  }
}
