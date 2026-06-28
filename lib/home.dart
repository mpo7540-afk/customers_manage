import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> customers = [];

  void addCustomer(String name) {
    setState(() {
      customers.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customers App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final controller = TextEditingController();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Add Customer"),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                  onPressed: () {
                    addCustomer(controller.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                )
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(customers[i]),
          );
        },
      ),
    );
  }
}
