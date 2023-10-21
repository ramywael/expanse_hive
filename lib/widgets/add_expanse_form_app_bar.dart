import 'dart:developer';

import 'package:expanse_hive/cubits/fetch_list_expanses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/addexpansecubit/add_expanse_cubit.dart';
import '../model/expanse_model.dart';
import 'custom_text_field.dart';

class AddExpanseForm extends StatefulWidget {
  const AddExpanseForm({Key? key}) : super(key: key);

  @override
  State<AddExpanseForm> createState() => _AddExpanseFormState();
}

class _AddExpanseFormState extends State<AddExpanseForm> {
  final DateTime initialDate = DateTime.now();
  final DateTime lastDate = DateTime.now();
  var _selectedCategory = Category.food;
  DateTime? _selectedDate;
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final DateTime firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: "Title",
          keyboardType: TextInputType.text,
          controller: _titleController,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: "Amount",
                keyboardType: TextInputType.number,
                controller: _amountController,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _selectedDate == null
                      ? const Text("No Date Selected")
                      : Text(formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: firstDate,
                        lastDate: lastDate,
                      );
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: DropdownButton(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                value:
                    _selectedCategory, // it displays the default value for the dropdown
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return; // we check if the value is null or not
                  }
                  // if null it will return nothing
                  return setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
            ),
            BlocBuilder<AddExpanseCubit, AddExpanseState>(
              builder: (context, state) => OutlinedButton(
                onPressed: () {
                  final double? doubledAmount = double.tryParse(
                    _amountController.text,
                  );
                  final bool isAmountInvalid =
                      doubledAmount == null || doubledAmount <= 0;
                  validateData(isAmountInvalid, context, doubledAmount!);
                  // WE NEED TO ADD THE DATA TO THE DATABASE
                  //BUT WE NEED TO CHECK THE VALIDATION OF THE DATA
                },
                child: state is AddExpanseLoading
                    ?  CircularProgressIndicator(
                  color : Theme.of(context).colorScheme.secondary,
                )
                    : const Text(
                        "Save Expanse",
                      ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Cancel",
              ),
            ),
          ],
        )
      ],
    );
  }

  void validateData(
      bool isAmountInvalid, BuildContext context, double doubledAmount) {
    if (_titleController.text.trim().isEmpty ||
        isAmountInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Invalid Input"),
            content: const Text("Please enter a valid title and amount"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
    } else {
      var expanseModel = ExpanseModel(
        _titleController.text,
        doubledAmount,
        formatter.format(_selectedDate!).toString(),
        _selectedCategory,
      );
      BlocProvider.of<AddExpanseCubit>(context).addExpanse(expanseModel);
      BlocProvider.of<FetchListExpansesCubit>(context).fetchAllExpanses();
      Navigator.pop(context);
    }
  }
}
