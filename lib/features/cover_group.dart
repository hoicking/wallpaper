import 'package:flutter/material.dart';
import 'package:wallpaper/consts/layout.dart';

class CoverGroup extends StatefulWidget  {
  final String title;
  final List<String> imageUrls;

  const CoverGroup({
    super.key,
    required this.title,
    required this.imageUrls
  });

  @override
  State<CoverGroup> createState() => _CoverGroupState();
}

class _CoverGroupState extends State<CoverGroup> {
   int selectedIndex = -1;

   @override
  void initState() {
    super.initState();
  }

  // 切换图片选中状态的方法
  void _toggleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        selectedIndex = -1;
      });
    });

  }

   @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 靠左对齐
        children: [
          Text( widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: Layout.space_2,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.imageUrls.asMap().entries.map((entry){
                final index = entry.key;
                final imageUrl = entry.value;
                return Padding(
                    padding: const EdgeInsets.only(right: Layout.space_3),
                    child: GestureDetector(
                      onTap: () => _toggleSelection(index),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              imageUrl,
                              width: 150, // 设置图片宽度
                              height: 250, // 设置图片高度
                              fit: BoxFit.cover,
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: selectedIndex == index ? 0.5 : 0.0,

                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Container(
                              width: 150,
                              height: 250,
                              decoration:
                                BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                            ),
                          ),
                        ],
                      ),
                    )
                  );
                }
              ).toList(),
            ),
          )
        ],
      );
    } 
}

