// coverage:ignore-file
import 'package:flutter/material.dart';

class ReserveButton extends StatelessWidget {
  const ReserveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 32, 176, 116),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'reservar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
