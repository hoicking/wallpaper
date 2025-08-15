import 'package:flutter/material.dart';

class BounceNaviIcon extends StatefulWidget {
  final Function() handleTap;
  final Icon icon;

  const BounceNaviIcon({
    super.key,
    required this.icon,
    required this.handleTap
  });

  @override
  State<BounceNaviIcon> createState() => _BounceNaviIconState();
}

class _BounceNaviIconState extends State<BounceNaviIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut
    ).drive(  
      Tween<double>(begin: 1.0, end: 1.2)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap () {
    _controller.reset();
    _controller.forward().then(
      (_) => _controller.reverse()
    );
    widget.handleTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Transform.translate(
            // 位移：放大时向上移动（值为负），复位时回到原位
            offset: Offset(0, -2 * (_animation.value - 1.0)),
            child: child, // 原始图标
          ),
        );
      },
      child: GestureDetector(
        onTap: _onTap,
        child:  Padding(
          padding: const EdgeInsets.all(11.0),
          child: widget.icon,
        ),
      ), // 替换为你的图标
      
    );
  }
}