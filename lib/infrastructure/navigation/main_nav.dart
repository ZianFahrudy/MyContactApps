import 'package:flutter/material.dart';
import 'package:my_contact_app/features/user/presentation/pages/home_page.dart';
import 'package:my_contact_app/features/user/presentation/pages/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({
    super.key,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final _selectedIndex = ValueNotifier<int>(0);
  final _pages = <Widget>[
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, _, __) => IndexedStack(
          index: _selectedIndex.value,
          children: _pages.map((page) => page).toList(),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, _, __) => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
              ),
              activeIcon: Icon(
                Icons.account_box,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex.value,
          onTap: (value) {
            _selectedIndex.value = value;
          },
        ),
      ),
    );
  }
}
