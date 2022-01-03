import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_house/models/AppModel.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget listTileBuilder(BuildContext context, IconData leading, String title,
      VoidCallback onTap) {
    return ListTile(
      leading: Icon(leading, color: Theme.of(context).accentColor),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      String? lang = prefs.getString('language_code');
    });

    // _selectedLang =
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    // print((mediaQueryData.size.width));
    return Drawer(
      elevation: 4,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                      // padding:
                      //     EdgeInsets.only(top: mediaQueryData.size.height * 0.1),
                      alignment: Alignment.center,
                      height: (mediaQueryData.size.height -
                              mediaQueryData.padding.top) *
                          0.20,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('images/default_profile.jpg'),
                          radius: 30,
                        ),
                        title: Text('Anonymous User'),
                      )),
                  Divider(
                    thickness: 1,
                  ),
                  Card(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    elevation: 0,
                    color:
                        Provider.of<AppModel>(context, listen: false).darkTheme
                            ? null
                            : Colors.white10,
                    child: SwitchListTile(
                      secondary: Icon(
                        Provider.of<AppModel>(context).darkTheme
                            ? CupertinoIcons.moon
                            : CupertinoIcons.sun_min,
                        color: Theme.of(context).accentColor,
                        size: 24,
                      ),
                      value: Provider.of<AppModel>(context).darkTheme,
                      onChanged: (bool value) {
                        if (value) {
                          Provider.of<AppModel>(context, listen: false)
                              .updateTheme(true);
                        } else {
                          Provider.of<AppModel>(context, listen: false)
                              .updateTheme(false);
                        }
                      },
                      title: Text(
                        'Dark Theme',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  )
                ],
              ),
            ),
            listTileBuilder(context, Icons.power_settings_new, 'Logout', () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}