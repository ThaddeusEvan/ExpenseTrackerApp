import 'package:expense_tracker/widget/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense_data.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  final List<ExpenseData> _registeredExpenses = [
    ExpenseData(
      title: 'Noodle',
      amount: 15000,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseData(
      title: 'Course',
      amount: 125000,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: _addingExpense,
        );
      },
    );
  }

  void _addingExpense(ExpenseData expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removingExpense(ExpenseData expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpenseList(
              expense: _registeredExpenses,
              onRemoveExpense: _removingExpense,
            ),
          ),
        ],
      ),
    );
  }
}
