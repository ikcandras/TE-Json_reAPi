import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/user_services.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  List<User> users = [];

  void fetchUsers() async {
    final result = await UserService.fetchUsers();
    users = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam TE-Jzon_reAPI'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              leading: user.profile_image.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(user.profile_image),
                    )
                  : const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
              title: Text(user.employee_name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.employee_age.toString()),
                  Text(user.employee_salary.toString()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
