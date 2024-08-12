import 'package:flutter/material.dart';
import 'package:html_front/tabs/bottom_tabs.dart';

class Tabs extends StatefulWidget {
  int selectedIndex = 0;
  Tabs({required this.selectedIndex});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<Tabs> {
  int _selectedIndex = 0;
  late String _email;
  late String _route;

  // bottom navigation 눌렸을 때
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = widget.selectedIndex;
      print(_selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _onItemTapped(widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: '상점',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on_rounded),
            label: '텃밭관리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
