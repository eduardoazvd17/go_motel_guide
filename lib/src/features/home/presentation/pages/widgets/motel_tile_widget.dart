import 'package:flutter/material.dart';

class MotelTileWidget extends StatelessWidget {
  const MotelTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'hotel barão',
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
                      Text('3,3km - praça seca - rio de janeiro'),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _ratingWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _imageWithTypeWidget(),
          _unavialableOnAppWidget(),
          _iconsWidget(),
          _priceWidget(context)
        ],
      ),
    );
  }

  Container _priceWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20),
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
                      '4 horas',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Text(
                        '10% off',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Text(
                      'R\$ 78,47',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey,
                            decorationColor: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                    Text(
                      'R\$ 70,98',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ],
      ),
    );
  }

  Container _iconsWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.ac_unit, color: Colors.grey),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.ac_unit, color: Colors.grey),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.ac_unit, color: Colors.grey),
            ),
          ),
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
              Text('4.0'),
            ],
          ),
        ),
        Text('31 avaliações'),
        Icon(Icons.keyboard_arrow_down, size: 20),
      ],
    );
  }

  Widget _imageWithTypeWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          Placeholder(fallbackHeight: 200),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('apartamento'),
          ),
        ],
      ),
    );
  }
}
