

import 'package:flutter/material.dart';
import 'package:wallpaper/features/custom_bottom_widget.dart';
import 'package:wallpaper/pages/home.dart';


class  MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  
  List<Widget> _buildPages (BuildContext context) {
    return [
      // Home(),
      // Fish(),
      Home(),
      Center(child: Text('service')),      
      Center(child: Text('me')),

    ];
  }

  @override
  Widget build(BuildContext context) {

    final pages = _buildPages(context);
    return Scaffold(
    key: _scaffoldKey,
    body: Stack(
      children: [
        pages[_currentIndex],
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer(
            ignoring: false, // 允许点击
            child: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() => _currentIndex = value);
              },
              icons: const [
                Icons.home,
                Icons.search,
                Icons.person,
              ],
            ),
          ),
        ),
      ],
    ),
    // 不要再用 bottomNavigationBar
  );

    // return Scaffold(
    //   key: _scaffoldKey,
    //   body: pages[_currentIndex],

    //   bottomNavigationBar: CustomBottomNavigationBar(
    //      currentIndex: _currentIndex,
    //      onTap: (value){
    //        setState(() => _currentIndex = value);
    //      },
    //      icons: const [
    //       Icons.home,
    //       Icons.search,
    //       Icons.person,
    //     ],
    //   ),
    // );
  }
}