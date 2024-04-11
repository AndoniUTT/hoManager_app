import 'package:flutter/material.dart';
import 'package:homanager_app/screens/login.dart';
import 'package:homanager_app/views/config_views/config_views.dart';
import 'package:homanager_app/views/home_views copy.dart';
import 'package:homanager_app/views/profile_views/profile_views.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  String username = 'Usuario'; 

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final screens = [ConfigViews(), const HomeViews(), ProfileViews()];

    return Scaffold(
      appBar: AppBar(
        title: Text('Casa de $username'), 
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()), 
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.app_settings_alt_outlined),
            activeIcon: const Icon(Icons.app_settings_alt),
            label: 'Configuración',
            backgroundColor: colors.tertiary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: colors.tertiary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_2_outlined),
            activeIcon: const Icon(Icons.person_2),
            label: 'Perfil',
            backgroundColor: colors.primary,
          ),
        ],
      ),
    );
  }
}
