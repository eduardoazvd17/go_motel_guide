// coverage:ignore-file
import 'package:flutter/material.dart';

class SliderIndicatorWidget extends StatefulWidget {
  final PageController pageController;
  final int totalPages;
  const SliderIndicatorWidget({
    super.key,
    required this.pageController,
    required this.totalPages,
  });

  @override
  State<SliderIndicatorWidget> createState() => _SliderIndicatorWidgetState();
}

class _SliderIndicatorWidgetState extends State<SliderIndicatorWidget> {
  int _currentPage = 0;

  @override
  void initState() {
    widget.pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPage = widget.pageController.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.totalPages,
          (index) {
            final bool isSelected = index == _currentPage;
            final double size = isSelected ? 12 : 8;
            final Color color = isSelected ? Colors.grey : Colors.grey.shade300;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: size,
              width: size,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            );
          },
        ),
      ),
    );
  }
}
