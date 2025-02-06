import 'package:flutter/material.dart';

import '../../../home.dart';

class SliderMotelTileWidget extends StatelessWidget {
  const SliderMotelTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        spacing: 10,
        children: [
          Expanded(child: SizedBox()),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Text('🔥', style: TextStyle(fontSize: 25)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'jumbo hotel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('campinho - rio de janeiro'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '30% de desconto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 10),
                Text('a partir de R\$ 99,65'),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: const ReserveButton(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
