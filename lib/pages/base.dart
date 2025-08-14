import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _buildPages (BuildContext context) {
    // final s = S.of(context);
    return [
      // Center(child: Text(s.plants)),
      // TestPage(),
      // Center(child: Text(s.alarm)),
      // const ServicePage(),
      // Center(child: Text(s.me)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages(context);

    return Scaffold(
      key: _scaffoldKey,
      body: pages[_currentIndex],
      // drawer: const BaseDrawer(),
      // appBar: const Header(title: '测试', imgUrl: 'http://192.168.100.163:5173/prod-api/statics/2025/04/01/1743476778773_20250401110642A002.png'),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() => _currentIndex = value);
          // 触发打开 BaseDrawer
          // _scaffoldKey.currentState?.openDrawer();
        },
        unselectedItemColor: Color(0xFF4D5253),
        selectedItemColor: Color(0xFF2796B1),
        items: [
          _buildNavItem(
            index: 0,
            selectedIcon: 'assets/images/navi/plant_selected.png',
            unselectedIcon: 'assets/images/navi/plant.png',
            label: S.of(context).plants
          ),
          _buildNavItem(
            index: 1,
            selectedIcon: 'assets/images/navi/alarm_selected.png',
            unselectedIcon: 'assets/images/navi/alarm.png',
            label: S.of(context).alarm
          ),
          _buildNavItem(
            index: 2,
            selectedIcon: 'assets/images/navi/services_selected.png',
            unselectedIcon: 'assets/images/navi/services.png',
            label: S.of(context).service
          ),
          _buildNavItem(
            index: 3,
            selectedIcon: 'assets/images/navi/me_selected.png',
            unselectedIcon: 'assets/images/navi/me.png',
            label: S.of(context).me
          )
        ]
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String selectedIcon,
    required String unselectedIcon,
    required String label
  }) {
    return BottomNavigationBarItem(icon: Image.asset(
        _currentIndex == index ? selectedIcon : unselectedIcon,
        width: 20,
        height: 20,
      ),
      label: label);
  }
}