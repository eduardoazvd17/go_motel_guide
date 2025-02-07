import 'package:flutter/material.dart';

class FiltersBarWidget extends StatelessWidget {
  const FiltersBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          spacing: 10,
          children: [
            _filterItem('filtros', icon: Icons.list),
            _filterItem('com desconto'),
            _filterItem('disponíveis'),
            _filterItem('hidro'),
            _filterItem('piscina'),
            _filterItem('sauna'),
            _filterItem('ofurô'),
          ],
        ),
      ),
    );
  }

  Widget _filterItem(String title, {IconData? icon}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        spacing: 10,
        children: [
          if (icon != null) Icon(icon, size: 20),
          Text(title),
        ],
      ),
    );
  }
}
