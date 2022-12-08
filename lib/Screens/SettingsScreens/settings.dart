import 'package:currentproject/Widgets/Models/progress_indicator.dart';
import 'package:currentproject/Widgets/theme_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:currentproject/Widgets/theme_labels.dart';
import 'package:currentproject/Screens/SettingsScreens/Personal/activity.dart';
import 'package:currentproject/Screens/SettingsScreens/Personal/profile.dart';
import 'package:currentproject/Services/auth.dart';

class SettingsStructure extends StatelessWidget {
  final AuthService _auth = AuthService();
  SettingsStructure({super.key});
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final activeuser = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return progressIndicator;
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something Went Wrong!'),
          );
        }
        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Header1(text: "Settings"),
              backgroundColor: MainColors.color2,
              actions: [
                IconButton(
                  icon: const Icon(Icons.qr_code),
                  tooltip: 'Rate With QR',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('This is a qr')));
                  },
                ),
              ],
            ),
            body: SettingsList(
              shrinkWrap: false,
              platform: DevicePlatform.android,
              lightTheme: SettingsThemeData(
                  titleTextColor: MainColors.color3,
                  settingsSectionBackground: Colors.transparent,
                  settingsListBackground: Colors.transparent),
              sections: [
                SettingsSection(
                  title: const Text(
                    'Profile',
                  ),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      onPressed: ((context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          )),
                      leading: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          radius: 35,
                          child: Image.network(activeuser!.photoURL.toString()),
                        ),
                      ),
                      title: Text(activeuser.displayName.toString()),
                      description: Text(activeuser.email.toString()),
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text('General'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(CupertinoIcons.heart_fill),
                      title: const Text('Activity'),
                      onPressed: ((context) => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Activity()),
                          )),
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text('Configuration'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(Icons.language),
                      title: const Text('Language'),
                      value: const Text('English'),
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text('More'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      onPressed: ((context) => showCupertinoDialog(
                          context: context,
                          builder: ((context) => AboutDialog(
                                  applicationVersion: 'Beta 1.0.0',
                                  applicationLegalese:
                                      '© 2022 VQ Standards Inc.',
                                  applicationName: 'VQ Standards',
                                  applicationIcon: Icon(
                                    Icons.verified,
                                    color: OtherColors.lightBlue,
                                    size: 30,
                                  ),
                                  children: const [
                                    ListTile(
                                      title: Text('Contact Us'),
                                      leading: Icon(CupertinoIcons.phone),
                                    ),
                                    ListTile(
                                      title: Text('Help Center'),
                                      leading: Icon(Icons.help_center),
                                    ),
                                    ListTile(
                                      title: Text('Terms and Privacy Policy'),
                                      leading: Icon(CupertinoIcons.book),
                                    ),
                                  ])))),
                      leading: const Icon(Icons.info),
                      title: const Text('Info'),
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.share),
                      title: const Text('Share'),
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.logout),
                      title: const Text('Log Out'),
                      onPressed: (context) async {
                        await _auth.signOut();
                      },
                    ),
                  ],
                ),
              ],
            ));
      }),
    );
  }
}
