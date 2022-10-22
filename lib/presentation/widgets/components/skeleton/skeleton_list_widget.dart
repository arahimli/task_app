import 'package:flutter/material.dart';


class SkeletonListWidget extends StatelessWidget {
  final int itemCount;
  final Widget child;
  const SkeletonListWidget({Key? key, this.itemCount = 4, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0; i < itemCount; i++)
              child,
          ],
        )
    );
  }
}
