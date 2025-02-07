// coverage:ignore-file
import 'package:flutter/material.dart';

import '../../../home.dart';

class SliderMotelSuiteWidget extends StatelessWidget {
  final DiscountSuiteDTO discountSuite;
  const SliderMotelSuiteWidget({super.key, required this.discountSuite});

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
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 180,
                child: Image.network(
                  discountSuite.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
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
                            discountSuite.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(discountSuite.neighborhood),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${discountSuite.discount.toStringAsFixed(0)}% de desconto',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'a partir de R\$ ${discountSuite.price.toStringAsFixed(2)}',
                ),
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
