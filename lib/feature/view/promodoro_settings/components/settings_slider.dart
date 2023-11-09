import 'package:flutter/material.dart';
import 'package:promodoro_app/core/utils/extensions.dart';

class SettingsSlider extends StatelessWidget {
  final String title;
  final double max;
  final double min;
  final double value;
  final void Function(double)? onChanged;
  const SettingsSlider(
      {super.key,
      required this.title,
      required this.max,
      required this.min,
      required this.value,
      required this.onChanged});

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
        SizedBox(
          height: 65,
          child: Stack(
            children: [
              Slider(
                  value: value.toDouble(),
                  max: max,
                  min: min,
                  onChanged: onChanged),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  width: context.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${min.toInt()} min',
                        ),
                        Text(
                          '${value.toInt()} min',
                        ),
                        Text(
                          '${max.toInt()} min',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
