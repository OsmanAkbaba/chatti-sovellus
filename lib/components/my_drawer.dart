import 'package:anna_sakkoa/services/auth/auth_service.dart';
import 'package:anna_sakkoa/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 50,
                  ),
                ),
              ),
              //home list tile eli ttässä luodaan kuvake kotisivulle
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListTile(
                  title: const Text("K o t i"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
              //settings list tile eli tässä luodaan kuvake asetuksille
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListTile(
                  title: const Text("A s e t u k s e t"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    //navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          //logout list tile eli uloskirjautumiselle luodaan kuvake
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 10.0),
            child: ListTile(
              title: const Text("K i r j a u d u  u l o s"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
