// coverage:ignore-file
import 'package:flutter/material.dart';

import '../../../home.dart';

class SuiteWidget extends StatelessWidget {
  final SuiteEntity suite;
  const SuiteWidget({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        _imageWithNameWidget(context),
        if (!suite.showAvailableQuantities) _unavialableOnAppWidget(),
        _categoriesIconsWidget(),
        ...suite.periods.map((period) => _periodsWidget(context, period)),
      ],
    );
  }

  Container _periodsWidget(BuildContext context, PeriodsEntity period) {
    final bool hasDiscount = period.discount > 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          border: suite.showAvailableQuantities
              ? null
              : Border(left: BorderSide(color: Colors.grey)),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        period.formattedTime,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: suite.showAvailableQuantities
                                  ? null
                                  : Colors.grey,
                            ),
                      ),
                      if (hasDiscount)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: suite.showAvailableQuantities
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          child: Text(
                            '${period.discount.toStringAsFixed(0)}% off',
                            style: TextStyle(
                              color: suite.showAvailableQuantities
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
                        )
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Text(
                        'R\$ ${period.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color:
                                  hasDiscount || !suite.showAvailableQuantities
                                      ? Colors.grey
                                      : null,
                              decorationColor: Colors.grey,
                              decoration: hasDiscount
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                      ),
                      if (hasDiscount)
                        Text(
                          'R\$ ${period.totalPrice.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: suite.showAvailableQuantities
                                        ? null
                                        : Colors.grey,
                                  ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            if (suite.showAvailableQuantities)
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Container _categoriesIconsWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...(suite.categories.length > 4
                  ? suite.categories.sublist(0, 4)
                  : suite.categories)
              .map((e) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(e.image, height: 30),
              ),
            );
          }),
          Row(
            spacing: 10,
            children: [
              Text(
                'ver\ntodos',
                textAlign: TextAlign.end,
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.keyboard_arrow_down, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _unavialableOnAppWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'indisponível no app',
            style: TextStyle(color: Colors.pink.shade900),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.pink.shade900,
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              spacing: 5,
              children: [
                Icon(Icons.notifications_none, color: Colors.white),
                Text(
                  'avise-me',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _imageWithNameWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(suite.images.first),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              suite.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
