import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_help/presentation/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  // static const padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AuthProvider>(context);
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName;
    final name = username!.substring(0, username.length - 8);
    final id = user?.email!.substring(1, 8);
    final photoURL = user?.photoURL;
    return Drawer(
      child: Material(
        // color: ColorResources.DRAWER_BG,
        child: ListView(
          // padding: padding,
          children: [
            const SizedBox(height: 20),
            buildHeader(
              name: name,
              email: id,
              imgURL: photoURL,
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),

            // buildMenuItem(
            //   text: 'Profile',
            //   icon: Icons.account_circle,
            //   onClicked: () {
            //     Navigator.pushNamed(context, '/profile');
            //   },
            // ),
            // buildMenuItem(
            //   text: 'My posted items',
            //   icon: Icons.format_list_bulleted,
            //   // onClicked: () => Navigator.pushNamed(context, '/'),
            //   onClicked: () {
            //     Navigator.pop(context);
            //     Navigator.pushNamed(context, '/my-items', arguments: user);
            //   },
            // ),
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
    required String? imgURL,
    required String? name,
    required String? email,
  }) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Row(
          children: [
            // Image.network(
            //   imgURL!,
            //   width: 10,
            //   height: 10,
            // ),
            // Expanded(
            //     child: CachedNetworkImage(
            //         imageUrl: imgURL!, width: 60, height: 60)),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imgURL!),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                ),
                const SizedBox(height: 4),
                Text(
                  email!,
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
