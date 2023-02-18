import 'package:flutter/material.dart';
import 'package:get_help/presentation/widgets/custom_drawer.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';

class StudentDasboard extends StatelessWidget {
  const StudentDasboard({super.key});

  @override
  Widget build(BuildContext context) {
    const student = {'name': 'John Doe', 'email': 'doe@gmail.com'};
    return ScaffoldWrapper(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          student['name']!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: const CustomDrawer(),
      body: const SafeArea(child: Text('Student Dasboard')),
    ));
  }
}
