import 'package:flutter/material.dart';
import 'package:wallpaper/features/rainbow_container.dart';

class ContactMe extends StatelessWidget {

  const ContactMe({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RainbowContainer(
          child: Row(
              spacing: 16,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // 圆角半径
                  child: Image(
                    image: AssetImage('assets/images/basic/avatar.jpg'), // 本地图片
                    // 或 NetworkImage('https://example.com/img.png') 网络图片
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Text('HolicStar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ],
            )
        );
    // Container(
    //   padding: const EdgeInsets.all(12.0),
    //   decoration: BoxDecoration(
    //     color: Color(0xFF212528),
    //     borderRadius: BorderRadius.circular(12)
    //   ),
    //   child: Row(
    //     spacing: 16,
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(12), // 圆角半径
    //         child: Image(
    //           image: AssetImage('assets/images/basic/avatar.jpg'), // 本地图片
    //           // 或 NetworkImage('https://example.com/img.png') 网络图片
    //           width: 50,
    //           height: 50,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       Text('HolicStar')
    //     ]
    //   ),
    // );
  }
}