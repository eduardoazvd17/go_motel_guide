// coverage:ignore-file
import 'package:flutter/material.dart';

class TabButtonsWidget extends StatefulWidget {
  const TabButtonsWidget({super.key});

  @override
  State<TabButtonsWidget> createState() => _TabButtonsWidgetState();
}

class _TabButtonsWidgetState extends State<TabButtonsWidget> {
  int _selectedTab = 0;
  void _onChanged(int tab) => setState(() => _selectedTab = tab);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: _button(
              icon: Icons.bolt,
              text: 'ir agora',
              isSelected: _selectedTab == 0,
              onTap: () => _onChanged(0),
            ),
          ),
          Expanded(
            child: _button(
              icon: Icons.calendar_today_outlined,
              text: 'ir outro dia',
              isSelected: _selectedTab == 1,
              onTap: () => _onChanged(1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _button({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.red : Colors.white,
              ),
              FittedBox(
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
