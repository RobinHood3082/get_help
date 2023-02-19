import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_help/presentation/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AuthProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName;
    final String name = displayName?.substring(0, displayName.length - 8) ?? '';
    final String studentID = user?.email!.substring(1, 8) ?? '';
    final String photoURL = user?.photoURL ??
        'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png';

    return Drawer(
      child: Material(
        // color: ColorResources.DRAWER_BG,
        child: ListView(
          // padding: padding,
          children: [
            const SizedBox(height: 20),
            buildHeader(
              name: name,
              id: studentID,
              photoURL: photoURL,
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout_rounded,
              onClicked: () {
                notifier.logout();
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required String photoURL,
    required String name,
    required String id,
  }) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(photoURL),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                ),
                const SizedBox(height: 4),
                Text(
                  id,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
