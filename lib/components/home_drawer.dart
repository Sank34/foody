import 'package:flutter/material.dart';
import 'package:foody/components/home_drawer_tile.dart';
import 'package:foody/services/auth/auth_service.dart';

import '../pages/settings_page.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80.0,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(color: Theme.of(context).colorScheme.secondary),
          ),

          //home list tile
          DrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings list tile
          DrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          const Spacer(),
          // logout list tile
          DrawerTile(text: 'LOG OUT', icon: Icons.settings, onTap: logout),

          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
