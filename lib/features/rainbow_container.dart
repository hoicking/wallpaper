import 'package:flutter/material.dart';

class RainbowContainer extends StatefulWidget {
  final Widget child;

  const RainbowContainer({
    super.key,
    required this.child,
  });

  @override
  State<RainbowContainer> createState() => _RainbowContainerState();
}

class _RainbowContainerState extends State<RainbowContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30), // 更长的周期，颜色变化更自然
    );

    // 监听动画状态变化，实现正向和反向循环
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成时反向播放
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画回到起点时正向播放
        _controller.forward();
      }
    });

    // 动画值从0到1
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear, // 线性曲线，确保颜色均匀变化
      ),
    );

    // 开始正向播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double offset = _animation.value;
        // 色相从0°（红）到360°（回到红），随offset平滑变化
        final double hue = offset * 360;

        // 确保色相值始终在0-360范围内
        double getValidHue(double value) {
          value = value % 360;
          if (value < 0) value += 360;
          return value;
        }

        return Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              // 渐变方向随offset变化，增强流动感
              begin: Alignment((offset - 0.5) * 2, (offset - 0.5) * 2),
              end: Alignment((offset + 0.5) * 2, (offset + 0.5) * 2),
              // 生成5种连续过渡的颜色，覆盖全彩虹光谱
              colors: [
                HSLColor.fromAHSL(1.0, getValidHue(hue), 0.8, 0.5).toColor(),
                HSLColor.fromAHSL(1.0, getValidHue(hue + 72), 0.8, 0.5).toColor(),
                HSLColor.fromAHSL(1.0, getValidHue(hue + 144), 0.8, 0.5).toColor(),
                HSLColor.fromAHSL(1.0, getValidHue(hue + 216), 0.8, 0.5).toColor(),
                HSLColor.fromAHSL(1.0, getValidHue(hue + 288), 0.8, 0.5).toColor(),
              ],
              tileMode: TileMode.mirror,
            ),
            boxShadow: [
              // 可以添加阴影增强视觉效果
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}
