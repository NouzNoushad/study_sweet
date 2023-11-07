import 'package:flutter/material.dart';
import 'package:promodoro_app/core/utils/extensions.dart';

class SettingsSlider extends StatelessWidget {
  final String title;
  final double value;
  const SettingsSlider({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            title,
          ),
        ),
        Stack(
          children: [
            Slider(value: value, onChanged: (value) {}),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: context.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1 min',
                      ),
                      Text(
                        '60 min',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
