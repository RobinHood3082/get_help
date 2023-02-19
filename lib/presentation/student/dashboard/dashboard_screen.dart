import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_help/presentation/widgets/custom_drawer.dart';
import 'package:get_help/presentation/widgets/scaffold_wrapper.dart';
import 'package:go_router/go_router.dart';

class StudentDasboard extends StatelessWidget {
  const StudentDasboard({super.key});

  @override
  Widget build(BuildContext context) {
    final UserInfo student = _buildUserInfo();

    return ScaffoldWrapper(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            student.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: const CustomDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_) => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add),
                          Text("Request for help"),
                          Icon(Icons.close)
                        ],
                      ),
                      OutlinedButton(
                          onPressed: () {
                            context.go('/add-counseling-request');
                          },
                          child: Row(
                            children: [
                              Text('Reqeust for counseling'),
                              Spacer(),
                              FaIcon(FontAwesomeIcons.circleChevronRight)
                            ],
                          ))
                    ],
                  ),
                );
              }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '',
            ),
          ],
        ),
        body: const SafeArea(child: Text('Student Dasboard')),
      ),
    );
  }

  UserInfo _buildUserInfo() {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName;
    final String name = displayName?.substring(0, displayName.length - 8) ?? '';
    final String studentID = user?.email!.substring(1, 8) ?? '';
    final String photoURL = user?.photoURL ??
        'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png';
    return UserInfo(name, studentID, photoURL);
  }
}

class UserInfo {
  final String name;
  final String id;
  final String photoURL;

  UserInfo(this.name, this.id, this.photoURL);
}
