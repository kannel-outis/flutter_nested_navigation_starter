import 'package:flutter/material.dart';
import 'package:flutter_nested_navigation_starter/files.dart';
import 'package:flutter_nested_navigation_starter/home.dart';
import 'package:flutter_nested_navigation_starter/profile.dart';
import 'package:flutter_nested_navigation_starter/router.dart';
import 'package:flutter_nested_navigation_starter/settings.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  final _bottomChildren = const <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.folder),
      icon: Icon(Icons.folder_outlined),
      label: 'Files',
    ),
    NavigationDestination(
      selectedIcon: Icon(Icons.person),
      icon: Icon(Icons.person_outlined),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_bottomChildren[_index].label),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const [
          HomePage(),
          FilesPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(NavRouter.routes.settings);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          _index = index;
          _controller.jumpToPage(index);
          setState(() {});
        },
        selectedIndex: _index,
        destinations: _bottomChildren,
      ),
    );
  }
}
