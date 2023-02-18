import 'package:flutter/material.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';
import 'package:go_router/go_router.dart';

class SignupRole extends StatelessWidget {
  const SignupRole({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset('assets/get_help.png'),
                const SizedBox(height: 80),
                OutlinedButton(
                  key: ValueKey('teacher'),
                  onPressed: () => context.go('/signin'),
                  child: Row(
                    children: const [
                      Text('Continue as Teacher'),
                      Spacer(),
                      Icon(Icons.arrow_circle_right_outlined)
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => context.go('/signin'),
                  child: Row(
                    children: const [
                      Text('Continue as Student'),
                      Spacer(),
                      Icon(Icons.arrow_circle_right_outlined)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
