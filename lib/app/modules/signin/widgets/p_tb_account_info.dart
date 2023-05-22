import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';


class AccountInfo extends StatefulWidget {
  final TabController? tabController;
  const AccountInfo({super.key, this.tabController});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Account Information',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.tabColor),
          ),
          const Text('Enter your Sign In credentials'),
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
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.appGrey, width: 2.0),
                ),
                hintText: 'e.g. Jhon@email.com'),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.appGrey, width: 2.0),
                ),
                hintText: 'e.g. MyPassword123',
                suffixIcon: const Icon(Icons.remove_red_eye_outlined)),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            height: 130,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Passord Requirements: '),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/done.svg'),
                    Text(
                      'Atleast one letter',
                      style: TextStyle(
                          color: AppColor.primaryColor0,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/done.svg'),
                    Text(
                      'Atleast one number',
                      style: TextStyle(
                          color: AppColor.primaryColor0,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/cross.svg',
                      height: 15,
                      width: 15,
                      color: AppColor.appGrey,
                    ),
                    Text(
                      'Atleast 8 characters',
                      style: TextStyle(color: AppColor.appGrey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/cross.svg',
                      height: 15,
                      width: 15,
                      color: AppColor.appGrey,
                    ),
                    Text(
                      'Atleast one capital letter',
                      style: TextStyle(color: AppColor.appGrey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Container(
          //         height: 40,
          //         width: 90,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5),
          //             border: Border.all(
          //               color: AppColor.primaryColor,
          //               width: 2,
          //             )),
          //         child: ElevatedButton(
          //           onPressed: () {
          //             widget.tabController
          //                 ?.animateTo(widget.tabController!.index - 1);
          //           },
          //           style: const ButtonStyle(
          //             elevation: null,
          //             backgroundColor:
          //                 MaterialStatePropertyAll(AppColor.scaffoldBackground),
          //           ),
          //           child: Text(
          //             'Back',
          //             style: TextStyle(color: AppColor.primaryColor0),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 40,
          //         width: 90,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5),
          //             border: Border.all(
          //               color: AppColor.disableTextColor,
          //               width: 2,
          //             )),
          //         child: ElevatedButton(
          //           onPressed: () {
          //             Navigator.pop(
          //               context,
          //             );
          //           },
          //           style: const ButtonStyle(
          //             elevation: null,
          //             backgroundColor:
          //                 MaterialStatePropertyAll(AppColor.scaffoldBackground),
          //           ),
          //           child: Text(
          //             'Cancel',
          //             style: TextStyle(color: AppColor.primaryColor),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 40,
          //         width: 90,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5),
          //             border: Border.all(
          //               color: AppColor.primaryColor,
          //               width: 2,
          //             )),
          //         child: ElevatedButton(
          //           onPressed: () {
          //             widget.tabController
          //                 ?.animateTo(widget.tabController!.index + 1);
          //           },
          //           style: const ButtonStyle(
          //             elevation: null,
          //             backgroundColor:
          //                 MaterialStatePropertyAll(AppColor.scaffoldBackground),
          //           ),
          //           child: Text(
          //             'Next',
          //             style: TextStyle(color: AppColor.primaryColor0),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
