// coverage:ignore-file
import 'package:flutter/material.dart';

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'minha localização',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              '..................................',
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
