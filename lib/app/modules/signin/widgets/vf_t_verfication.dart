import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:pinput/pinput.dart';

class VeriFication extends StatefulWidget {
  final TabController? tabController;
  const VeriFication({super.key, this.tabController});

  @override
  State<VeriFication> createState() => _VeriFicationState();
}

class _VeriFicationState extends State<VeriFication>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.dividerColor,
            width: 1.5, // adjust as needed
          ),
        ),
        // borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
      color: const Color.fromRGBO(234, 239, 243, 1),
      border: Border(
        bottom: BorderSide(
          color: AppColor.primaryColor,
          width: 1.5, // adjust as needed
        ),
      ),
    ));
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Verification',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.tabColor),
            ),
            const Text('Enter the 4-digit code'),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              color: AppColor.dividerColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Averification code has been sent to '),
            Text(
              '+92 3099009102',
              style: TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Please enter the code below'),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 47,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                      text: 'Don\'t Recieve anthing? \n ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: '\t\t\t\t\t\t\t\t\tResend code',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context,
                              '/signup1'); 
                        },
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
