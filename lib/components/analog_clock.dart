import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:analog_clock/my_colors.dart';
import 'package:analog_clock/size_config.dart';
import 'package:analog_clock/utils/analog_clock_calculator.dart';
import 'package:analog_clock/models/my_theme_provider.dart';

class AnalogClock extends StatefulWidget {
  AnalogClock({Key key}) : super(key: key);

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24.0),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: MyColors.shadowColor.withOpacity(0.14),
                    blurRadius: 64,
                  )
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Consumer<MyThemeModel>(
            builder: (context, theme, child) => GestureDetector(
              onTap: () => theme.changeTheme(),
              child: SvgPicture.asset(
                theme.isLightTheme
                    ? "assets/icons/sun.svg"
                    : "assets/icons/moon.svg",
                width: 24,
                height: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    AnalogClockCalculator clockCalculator = AnalogClockCalculator(
      size: size,
      dateTime: dateTime,
    );

    Paint minutesHandBrush = Paint()
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    Paint hoursHandBrush = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    Paint secondsHandBrush = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    Paint primaryColorPaint = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;

    Paint backgroundColorPaint = Paint()
      ..color = Theme.of(context).backgroundColor;

    Paint secondsMarkerBrush = Paint()
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    Paint cornersMarkerBrush = Paint()
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    canvas.drawLine(
      center,
      clockCalculator.getMinuteOffet(length: 0.35),
      minutesHandBrush,
    );

    canvas.drawLine(
      center,
      clockCalculator.getHourOffset(length: 0.3),
      hoursHandBrush,
    );

    canvas.drawLine(
      center,
      clockCalculator.getSecondOffset(length: 0.4),
      secondsHandBrush,
    );

    canvas.drawCircle(center, 16, primaryColorPaint);
    canvas.drawCircle(center, 14, backgroundColorPaint);
    canvas.drawCircle(center, 6, primaryColorPaint);

    // TODO: criar uma opção para exibir/ocultar os marcadores
    bool showMarkers = false;

    if (showMarkers) {
      double outerCircleRadius = radius;
      double innerCircleRadius = radius - 4;

      for (double i = 0; i < 360; i += 6) {
        double x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        double y1 = centerX + outerCircleRadius * sin(i * pi / 180);
        double x2 = centerX + innerCircleRadius * cos(i * pi / 180);
        double y2 = centerX + innerCircleRadius * sin(i * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), secondsMarkerBrush);
      }

      for (double i = 0; i < 360; i += 24) {
        double x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        double y1 = centerX + outerCircleRadius * sin(i * pi / 180);
        double x2 = centerX + (innerCircleRadius - 4) * cos(i * pi / 180);
        double y2 = centerX + (innerCircleRadius - 4) * sin(i * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), cornersMarkerBrush);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
