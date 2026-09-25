import 'package:flutter/material.dart';

class BuildMyNavBar extends StatelessWidget {
  const BuildMyNavBar({
    super.key,
    required this.pageIndex,
    required this.onPageSelected,
  });

  final int pageIndex;
  final ValueChanged<int> onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB9C3DF).withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          _navItem(0, Icons.home_outlined, 'Home'),
          _navItem(1, Icons.add, 'Book'),
          _navItem(2, Icons.crop_square, 'Scan'),
          _navItem(3, Icons.swap_horiz, 'Ops'),
          _navItem(4, Icons.more_horiz, 'More'),
        ],
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    final isSelected = pageIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => onPageSelected(index),
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF26369E)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : const Color(0xFF4B5A7B),
                size: isSelected ? 20 : 18,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF102681)
                    : const Color(0xFF33456D),
                fontSize: 9,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 21 : 0,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC800),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
