import 'package:flutter/material.dart';

class ActionSheet extends StatelessWidget {
  final Widget trigger;
  final Widget content;
  const ActionSheet({
    super.key,
    required this.trigger,
    required this.content
  });

  void _showQRCodeSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // padding: EdgeInsets.zero, // 清除默认内边距
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        vsync: ModalRoute.of(context)!.navigator!,
        duration: const Duration(milliseconds: 300),
      )..drive(CurveTween(curve: Curves.easeOut)),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16), // 两侧间距
          child: Container(
            // 关键：仅控制宽度撑满，高度由子组件决定
            constraints: const BoxConstraints(minWidth: double.infinity),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 高度仅包裹子组件
              children: [
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(3)),
                  margin: const EdgeInsets.only(bottom: 20),
                ),
                const SizedBox(height: 20),
                content,
                // Image.asset('assets/images/basic/qrcode.png', width: 200, height: 200),
                // const SizedBox(height: 20),
                // const Text("请使用相机扫描此二维码", style: TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showQRCodeSheet(context),
      child: trigger,
    );
  }
}