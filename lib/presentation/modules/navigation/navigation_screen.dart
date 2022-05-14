import 'package:flutter/material.dart';
import 'package:flutter_mockup_bloc/presentation/screens/home_screen.dart';
import 'package:flutter_mockup_bloc/presentation/screens/profile_screen.dart';
import 'package:flutter_mockup_bloc/provider/data_provider_widget.dart';

class NavigationScreen extends StatefulWidget {

  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderLocalization: (context, localization) => Scaffold(
        body: IndexedStack(
          children: const [
            HomeScreen(),
            ProfileScreen(),
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTap,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              label: localization.todoTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: localization.settingsTitle,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int newIndex) {
    setState(() => _currentIndex = newIndex);
  }
}
