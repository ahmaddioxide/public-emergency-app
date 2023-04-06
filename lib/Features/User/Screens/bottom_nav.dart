import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:public_emergency_app/Features/User/Screens/User DashBoard/user_dashboard.dart';
import 'package:public_emergency_app/Features/User/Screens/LiveStreaming/sos_page.dart';
import 'package:public_emergency_app/Features/User/Screens/Profile/profile_screen.dart';
import '../../../Common Widgets/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 1;
  String userType = "";
  var screens = const [
    ProfileScreen(),
    UserDashboard(),
    LiveStreamUser(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (userType == "Police") {
    //  setState(() {
    //    screens = const [
    //      ProfileScreen(),
    //      PoliceDashboard(),
    //      EmergenciesScreen(),
    //    ];
    //  });
    // } else if (userType == "Ambulance") {
    //  setState(() {
    //    screens = const [
    //      ProfileScreen(),
    //      AmbulanceDashboard(),
    //      EmergenciesScreen(),
    //    ];
    //  });
    // } else if (userType == "Fire") {
    //   setState(() {
    //     screens = const [
    //       ProfileScreen(),
    //       FirefighterDashboard(),
    //       EmergenciesScreen(),
    //     ];
    //   });
    // } else if (userType == "User") {
    //   setState(() {
    //     screens = const [
    //       ProfileScreen(),
    //       UserDashboard(),
    //       LiveStreamUser(),
    //     ];
    //   });
    // } else {
    //   setState(() {
    //     screens = const [
    //       ProfileScreen(),
    //       UserDashboard(),
    //       LiveStreamUser(),
    //     ];
    //   });
    // }
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          backgroundColor: Colors.white,
          color: Color(color),
          animationDuration: const Duration(milliseconds: 300),
          height: 55,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            Icon(
              Icons.person,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.emergency,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.video_call,
              size: 24,
              color: Colors.white,
            )
          ]),
      body: screens[currentIndex],
    );
  }
}
