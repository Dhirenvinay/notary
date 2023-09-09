
import 'package:apinew/controller.dart';
import 'package:apinew/expenselist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  final StorageController storageController = Get.put(StorageController());
  TextEditingController emailController = TextEditingController();

  Future<http.Response> makeApiCall(String email) async {
    final apiUrl = 'https://staging.thenotary.app/doLogin'; // Replace with your actual API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'email': email},
    );

    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelText: "user email",
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 56, 13,),
                    // Colors.grey, // Change color when enabled/disabled
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: InkWell(
                onTap: ()
                async {
                  final response = await makeApiCall(emailController.text);

                  if (response != null) {
                    storageController.storeResponse(response.body);
                    Get.to(ExpensesListScreen());
                  }

                },// Disable the button if fields are empty
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}