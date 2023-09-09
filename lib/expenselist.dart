
import 'package:apinew/controller.dart';
import 'package:apinew/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesListScreen extends StatefulWidget {
  @override
  _ExpensesListScreenState createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  final StorageController storageController = Get.find();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController expenseNameController = TextEditingController();

  List<Expense> filteredExpenses = [];

  @override
  void initState() {
    super.initState();
    filterExpenses('');
  }


  void filterExpenses(String searchTerm) {
    final apiResponse = storageController.apiResponse.value;
    if (apiResponse != null) {
      final expenses = apiResponse.expenseList;
      setState(() {
        filteredExpenses = expenses.where((expense) {
         // final description = expense.description.toLowerCase();
          final expenseName = expense.expenseName.toLowerCase();
          return expenseName.contains(searchTerm);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Container(
        height:40,
          color: Colors.white,
          child: Text('Expenses List',style: TextStyle(color: Colors.black),)),centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: TextField(
              controller: searchController,
              onChanged: (_) {
                setState(() {
                  filterExpenses(searchController.text.toLowerCase());
                });

              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50).copyWith(bottomRight: Radius.zero,topRight: Radius.zero),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50).copyWith(bottomRight: Radius.zero,topRight: Radius.zero),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                labelText: "Search Expense",
                labelStyle: TextStyle(color: Colors.black),

              ),
            ),
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: TextField(
          //
          //     decoration: InputDecoration(labelText: 'Search Expense'),
          //   ),
          // ),
          if (filteredExpenses.isNotEmpty)
           // Card(
            //  margin: EdgeInsets.all(8.0),
             // child:
              Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: TextStyle(height: 3),
                      controller: expenseNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10).copyWith(bottomRight: Radius.zero,topRight: Radius.zero),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10).copyWith(bottomRight: Radius.zero,topRight: Radius.zero),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: "Expense name",
                        labelStyle: TextStyle(color: Colors.black),

                      ),
                    ),
                  ),
                  // TextField(
                  //   controller: descriptionController,
                  //   decoration: InputDecoration(labelText: 'Description'),
                  // ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height*0.2,
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(style: TextStyle(height: 4),
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10).copyWith(bottomRight: Radius.zero,topRight: Radius.zero),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10).copyWith(bottomRight: Radius.zero,topRight: Radius.zero),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: "Discription",
                        labelStyle: TextStyle(color: Colors.black),

                      ),
                    ),
                  ),

                  // TextField(
                  //   controller: expenseNameController,
                  //   decoration: InputDecoration(labelText: 'Expense Name'),
                  // ),
                ],
              ),
           // ),
          if (filteredExpenses.isEmpty)
            Center(
              child: Text('No expenses found.'),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredExpenses.length,
              itemBuilder: (context, index) {
                final expense = filteredExpenses[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(expense.expenseName),
                    subtitle: Text(expense.description),
                    onTap: () {
                      descriptionController.text = expense.description;
                      expenseNameController.text = expense.expenseName;
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


