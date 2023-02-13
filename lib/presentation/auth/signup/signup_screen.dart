import 'package:get_help/core/utils/notifier_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_help/presentation/auth/auth_provider.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      child: Scaffold(
        body: Consumer<AuthProvider>(builder: (context, value, child) {
          if (value.notifierState == NotifierState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset(
                      'assets/get_help.png',
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 80),
                  OutlinedButton(
                    onPressed: () {
                      final provider =
                          Provider.of<AuthProvider>(context, listen: false);
                      provider.googleLogin();
                    },
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: const Color(0xFF261C2C),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(40), // <-- Radius
                    //   ),
                    // ),
                    child: SizedBox(
                      width: 300,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/google-icon.svg',
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Continue with official CUET email',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
