import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';

class AllCounselingRequestsTeacherScreen extends StatelessWidget {
  const AllCounselingRequestsTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      child: Scaffold(
        body: Text('teacher'),
      ),
    );
  }
}
