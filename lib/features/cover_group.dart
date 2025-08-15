import 'package:flutter/material.dart';
import 'package:wallpaper/consts/layout.dart';

class CoverGroup extends StatelessWidget  {
  final String title;
  final List<String> imageUrls;

  const CoverGroup({
    super.key,
    required this.title,
    required this.imageUrls
  });

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 靠左对齐
      children: [
        Text( title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: Layout.space_2,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageUrls.map((imageUrl) => Padding(
              padding: const EdgeInsets.only(right: Layout.space_3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  width: 150, // 设置图片宽度
                  height: 250, // 设置图片高度
                  fit: BoxFit.cover, // 填充方式
                ),
              ),
            )).toList(),
          ),
        )
        // Wrap(
        //   spacing: 8.0,
        //   runSpacing: 8.0,
        //   children: imageUrls.map((imageUrl) => Image.asset(imageUrl)).toList(),
        // ),
      ],
    );
  } 
}