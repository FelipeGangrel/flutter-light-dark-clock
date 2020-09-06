import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:analog_clock/size_config.dart';
import 'package:analog_clock/components/digital_clock.dart';
import 'package:analog_clock/components/analog_clock.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: buildSettingsButton(context),
        actions: [buildAddButton(context)],
      ),
      body: HomeBody(),
    );
  }

  IconButton buildSettingsButton(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        "assets/icons/settings.svg",
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () {},
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10.0),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: getProportionateScreenWidth(32.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Rio de Janeiro",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DigitalClock(),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnalogClock(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
