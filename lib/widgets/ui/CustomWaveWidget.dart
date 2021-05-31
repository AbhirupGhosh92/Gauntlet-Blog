import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class CustomWaveWidgets extends WaveWidget {
  CustomWaveWidgets()
      : super(
          config: CustomConfig(
            gradients: [
              [Color(0xffff1245), Color(0xffff00a0)],
              [Color(0xfffe75fe), Color(0xff7a04eb)],
              [Color(0xffa0ffe3), Color(0xff65dc98)]
            ],
            durations: [5000, 7000, 9000],
            heightPercentages: [0.1, 0.4, 0.7],
            blur: MaskFilter.blur(BlurStyle.normal, 100),
            gradientBegin: Alignment.topCenter,
            gradientEnd: Alignment.bottomCenter,
          ),
          waveAmplitude: 30,
          size: Size(
            double.infinity,
            double.infinity,
          ),
        );
}
