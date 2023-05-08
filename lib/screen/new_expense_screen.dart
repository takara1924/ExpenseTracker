import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:intl/intl.dart';

var _selectedDate;
var _selectedTime;

class NewExpense extends StatefulWidget {
  const NewExpense(
      {super.key, required this.expensesList, required this.addExpense});

  final List<Expense> expensesList;

  final void Function(Expense item) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  Category selectedCategory = Category.food;

  void _selectDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _selectTime() async {
    final timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      _selectedTime = timePicker;
    });
  }

  bool check() {
    final enteredAmount = double.tryParse(amountController.text);
    if (_selectedDate != null &&
        _selectedTime != null &&
        titleController.text.trim() != '' &&
        enteredAmount != null &&
        enteredAmount > 0) {
      return true;
    }
    return false;
  }

  void add() {
    if (!check()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error Catched!'),
            content: const Text('Invalid Value! Please try again'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      widget.addExpense(
        Expense(
          amount: double.parse(amountController.text),
          category: selectedCategory,
          date: _selectedDate,
          name: titleController.text,
          time: _selectedTime,
        ),
      );
      Navigator.pop(context);
    }
    _selectedDate = null;
    _selectedTime = null;
  }

  @override
  Widget build(BuildContext context) {
    // bool _isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(child: LayoutBuilder(builder: (ctx, constraint) {
      return SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, keyboardSpace + 16),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    const Text('Create a New Expense'),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Expense Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Expense Name'),
                            const SizedBox(
                              height: 8,
                            ),
                            TextField(
                              maxLength: 25,
                              controller: titleController,
                              decoration: const InputDecoration(
                                hintText: 'Enter the name of the expense',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //Expense Amount
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Expense Amount'),
                            const SizedBox(
                              height: 8,
                            ),
                            TextField(
                              controller: amountController,
                              decoration: const InputDecoration(
                                hintText: 'Enter the amount',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //Date and Time
                        Row(
                          children: [
                            //Date
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Date'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(_selectedDate == null
                                              ? 'Select Date'
                                              : formatter
                                                  .format(_selectedDate)),
                                        ),
                                        IconButton(
                                          onPressed: _selectDate,
                                          icon: const Icon(
                                              Icons.date_range_outlined),
                                          // style: IconButton.styleFrom(
                                          //   foregroundColor: Colors.black,
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            //Time
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Time'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          (_selectedTime == null)
                                              ? 'Select Time'
                                              : DateFormat('hh:mm a').format(
                                                  DateTime(
                                                    2022,
                                                    01,
                                                    01,
                                                    _selectedTime.hour,
                                                    _selectedTime.minute,
                                                  ),
                                                ),
                                        ),
                                        IconButton(
                                          onPressed: _selectTime,
                                          icon: const Icon(
                                              Icons.watch_later_outlined),
                                          // style: IconButton.styleFrom(
                                          //   foregroundColor: Colors.black,
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //DropdownButton
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Category'),
                            DropdownButton(
                              isExpanded: true,
                              value: selectedCategory,
                              items: Category.values
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item.name.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  if (value != null) {
                                    selectedCategory = value;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //Button
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _selectedDate = null;
                                _selectedTime = null;
                              },
                              child: const Text('Cancel'),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              iconSize: 40,
                              onPressed: add,
                              icon: const Icon(
                                Icons.add_circle_sharp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
