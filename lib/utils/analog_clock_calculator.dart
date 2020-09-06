import 'dart:math';
import 'dart:ui';

class AnalogClockCalculator {
  // Calculo para posição dos ponteiros
  // https://www.youtube.com/watch?v=HyAeZKWWuxA&ab_channel=CodeX

  final Size size;
  final DateTime dateTime;
  static double centerX;
  static double centerY;

  AnalogClockCalculator({this.size, this.dateTime}) {
    centerX = size.width / 2;
    centerY = size.height / 2;
  }

  void init(Size size, DateTime dateTime) {}

  Offset getMinuteOffet({double length}) {
    double minuteX =
        centerX + size.width * length * cos((dateTime.minute * 6) * pi / 180);
    double minuteY =
        centerY + size.width * length * sin((dateTime.minute * 6) * pi / 180);
    return Offset(minuteX, minuteY);
  }

  Offset getHourOffset({double length}) {
    // dateTime.hour * 30, pois 360 / 12 = 30
    // dateTime.minute * 0.5, pois a cada vez que se passa um minuto vamos mover um pouquinho o ponteiro de hora

    double hourX = centerX +
        size.width *
            length *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            length *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    return Offset(hourX, hourY);
  }

  Offset getSecondOffset({double length}) {
    // dateTime.second * 6, pois 360 / 60 = 6
    double secondX =
        centerX + size.width * length * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * length * sin((dateTime.second * 6) * pi / 180);
    return Offset(secondX, secondY);
  }
}
