import 'package:flutter/material.dart';
import 'package:wallpaper/consts/layout.dart';
import 'package:wallpaper/features/cover_group.dart';

class Home extends StatefulWidget {
    const Home({super.key});

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoverGroup(title: '和风', imageUrls: [
                'assets/images/covers/group1/1.jpg',
                'assets/images/covers/group1/2.jpg',
                'assets/images/covers/group1/3.jpg',
                'assets/images/covers/group1/4.jpg',
                'assets/images/covers/group1/5.jpg',
                'assets/images/covers/group1/6.jpg',
              ]),
              SizedBox(height: Layout.space_3),
              CoverGroup(title: '庭院', imageUrls: [
                'assets/images/covers/group2/1.jpg',
                'assets/images/covers/group2/2.jpg',
                'assets/images/covers/group2/3.jpg',
                'assets/images/covers/group2/4.jpg',
                'assets/images/covers/group2/5.jpg',
                'assets/images/covers/group2/6.jpg',
              ]),
              SizedBox(height: Layout.space_3),
              CoverGroup(title: '夕阳', imageUrls: [
                'assets/images/covers/group3/1.jpg',
                'assets/images/covers/group3/2.jpg',
                'assets/images/covers/group3/3.jpg',
                'assets/images/covers/group3/4.jpg',
                'assets/images/covers/group3/5.jpg',
                'assets/images/covers/group3/6.jpg',
              ]),
            ],
          ),
        ),
      ), 
    );
  }
}