import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<IconData> icons;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Color backgroundColor;
  final double iconSize;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color baseColor;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.icons,
    this.horizontalPadding = 24.0,
    this.verticalPadding = 16.0,
    this.borderRadius = 36.0,
    this.backgroundColor = Colors.grey,
    this.iconSize = 28.0,
    this.selectedIconColor = Colors.blue,
    this.unselectedIconColor = Colors.grey,
    this.baseColor = const Color(0xFF212528)

  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          margin: EdgeInsets.only(
            bottom: verticalPadding
          ),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(icons.length * 2 - 1, (i) {
              if (i.isOdd) {
                return SizedBox(width: 24);
              }
              final index = i ~/ 2;
              final isSelected = index == currentIndex;
              return Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  icon: Icon(icons[index]),
                  color: isSelected ? baseColor : Colors.white,
                  iconSize: iconSize,
                  onPressed: () => onTap(index),
                )
              );
            }),
          ),
        ),
      ),
    );
  }
}