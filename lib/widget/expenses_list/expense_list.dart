import 'package:expense_tracker/models/expense_data.dart';
import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expense,
    required this.onRemoveExpense,
  });

  final void Function(ExpenseData expense) onRemoveExpense;
  final List<ExpenseData> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: ((context, index) => Dismissible(
            key: ValueKey(expense[index]),
            onDismissed: ((direction) {
              onRemoveExpense(expense[index]);
            }),
            child: ExpenseItem(
              expense[index],
            ),
          )),
    );
  }
}
