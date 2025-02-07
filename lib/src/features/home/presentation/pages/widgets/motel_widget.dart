// coverage:ignore-file
import 'package:flutter/material.dart';

import '../../../home.dart';

class MotelWidget extends StatelessWidget {
  final MotelEntity motel;
  const MotelWidget({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: _motelDataWidget(context),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 900),
          child: LayoutBuilder(builder: (context, constraints) {
            return PageView(
              controller: PageController(viewportFraction: 0.88),
              scrollDirection: Axis.horizontal,
              children: motel.suites.map((e) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SuiteWidget(suite: e),
                  ),
                );
              }).toList(),
            );
          }),
        ),
      ],
    );
  }

  Widget _motelDataWidget(BuildContext context) {
    return Row(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(child: Image.network(motel.logo, height: 60)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      motel.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
              Text(
                '${motel.distance.toStringAsFixed(1)}km - ${motel.neighborhood}',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _ratingWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _ratingWidget() {
    return Row(
      spacing: 10,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 2.5),
          child: Row(
            spacing: 2.5,
            children: [
              Icon(
                Icons.star,
                size: 15,
                color: Colors.orange,
              ),
              Text(motel.rating.toStringAsFixed(1)),
            ],
          ),
        ),
        Text('${motel.ratingQuantity} avaliações'),
        Icon(Icons.keyboard_arrow_down, size: 20),
      ],
    );
  }
}
