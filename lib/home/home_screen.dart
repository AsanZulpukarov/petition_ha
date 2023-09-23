import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/app_colors.dart';
import '../drawer/hotKeshAdd.dart';
import '../pages/dashboard.dart';
import '../pages/favorite.dart';
import '../pages/messeg.dart';
import '../pages/profile/profile.dart';
import '../provider/selectTabProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> screens = [
    Dashboard(),
    Favorite(),
    Messej(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: Provider.of<SelectTabProvider>(context).currentScreen,
        bucket: bucket,
      ),


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        // notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Dashboard(),
                          0); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.home_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 0
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(HotKeshAdd(),
                          2); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.add_to_photos_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 2
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Favorite(),
                          1); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 1
                      ? Color(0xFFFF6B00)
                      : Color(0xFF225196),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  Provider.of<SelectTabProvider>(context, listen: false)
                      .toggleSelect(Profile(),
                          3); // if user taps on this dashboard tab will be active
                },
                child: Icon(
                  Icons.perm_identity_outlined,
                  color: Provider.of<SelectTabProvider>(context).currentTab == 3
                      ? AppColors.red1
                      : AppColors.blue1,
                ),
              ),

              // Right Tab bar icons
            ],
          ),
        ),
      ),
    );
  }
}
