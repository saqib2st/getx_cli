import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PunchClockScreen extends StatefulWidget {
  const PunchClockScreen({super.key});

  @override
  State<PunchClockScreen> createState() => _PunchClockScreenState();
}

class _PunchClockScreenState extends State<PunchClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
                text: '15 ',
                style: TextStyle(color: AppColor.primaryColor2, fontSize: 30)),
            TextSpan(
                text: 'October',
                style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
          ])),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('10:30 - 20:30',
                  style: TextStyle(color: AppColor.appGrey, fontSize: 20)),
              Text('09:58:55',
                  style: TextStyle(color: AppColor.appGrey, fontSize: 20)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Waiter',
                style: TextStyle(color: AppColor.primaryColor2, fontSize: 16),
              ),
              Text(
                '1.248 Kr.',
                style: TextStyle(color: AppColor.primaryColor2, fontSize: 15),
              ),
            ],
          ),
          Divider(
            height: 40,
            thickness: 5,
            color: AppColor.disableTextColor,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/Salary.svg',
                height: 15,
              ),
              const Text(' 1.213 kr',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          Row(
            children: [
              CircularPercentIndicator(
                radius: 90.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 5.0,
                percent: 0.5,
                center: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '\t\t\t\tActive Time \n ',
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: '02:57:37',
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 28,
                            fontWeight: FontWeight.normal)),
                  ])),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: AppColor.disableButtonColor,
                progressColor: AppColor.primaryColor,
              ),
              const Column(
                children: [
                  Text('PUNCH IN TIME'),
                  Text('PUNCH IN TIME'),
                  Text('PUNCH IN TIME'),
                  Text('PUNCH IN TIME'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
