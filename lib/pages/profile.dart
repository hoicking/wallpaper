import 'package:flutter/material.dart';
import 'package:wallpaper/features/contact_me.dart';
import 'package:wallpaper/features/action_sheet.dart';

class Profile extends StatefulWidget{

  const Profile({
    super.key
  });

  @override
  State createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Scaffold本身会填充整个屏幕
      child: SingleChildScrollView(
          // 让内容可滚动（避免键盘弹出时溢出）
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                // 垂直方向尽可能扩展
                mainAxisSize: MainAxisSize.max,
                children: [
                  // 你的内容组件
                  ActionSheet(
                    trigger: ContactMe(), 
                    content: Column(
                      children: [
                        Image.asset('assets/images/basic/qrcode.png', width: 200, height: 200)
                    ])
                  ),
                  SizedBox(height: 20),
                  ActionSheet(
                    trigger: ContactMe(), 
                    content: Column(
                      children: [
                        Image.asset('assets/images/basic/qrcode.png', width: 200, height: 200)
                    ])
                  ),
                  SizedBox(height: 20),
                  // Text('Self-pleasure', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
        ),
    );
  }
}