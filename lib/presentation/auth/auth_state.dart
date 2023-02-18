import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_help/presentation/auth/signup/signup_role_screen.dart';
import 'package:get_help/presentation/student/dashboard/dashboard_screen.dart';
import 'package:get_help/presentation/teacher/dashboard/dashboard_screen.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final user = FirebaseAuth.instance.currentUser;
            final re = RegExp(r"u(.*)@student.cuet.ac.bd");
            if (user!.email == null) {
              return const Center(child: Text('Something went wrong!'));
            }
            // if (user!.email != null) {
            final isStudent = re.hasMatch(user.email!);
            debugPrint(isStudent.toString());
            if (isStudent) {
              return const StudentDasboard();
            } else {
              return const TeacherDashboard();
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          } else {
            return const SignupRole();
          }
        },
      ),
    );
  }
}
