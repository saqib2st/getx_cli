import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';

class PhoneInfo extends StatefulWidget {
  final TabController? tabController;
  const PhoneInfo({super.key, this.tabController});

  @override
  State<PhoneInfo> createState() => _PhoneInfoState();
}

class _PhoneInfoState extends State<PhoneInfo> {
  final TextEditingController _countryCode = TextEditingController();

  @override
  void initState() {
    _countryCode.text = 'PK +92';
    super.initState();
  }

  @override
  void dispose() {
    _countryCode.dispose();
    super.dispose();
  }

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
            'Phone Number',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.tabColor),
          ),
          const Text('Please enter your phone number'),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 5,
            color: AppColor.dividerColor,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(children: [
            SizedBox(
              width: 130,
              child: TextField(
                controller: _countryCode,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appGrey, width: 2.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.appGrey, width: 2.0),
                  ),
                  hintText: 'eg. 12 23 45 54'),
            )),
          ]),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Country Code',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150,
              ),
              Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 310,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       height: 40,
          //       width: 90,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(5),
          //           border: Border.all(
          //             color: AppColor.primaryColor,
          //             width: 2,
          //           )),
          //       child: ElevatedButton(
          //         onPressed: () {
          //           widget.tabController
          //               ?.animateTo(widget.tabController!.index - 1);
          //         },
          //         style: const ButtonStyle(
          //           elevation: null,
          //           backgroundColor:
          //               MaterialStatePropertyAll(AppColor.scaffoldBackground),
          //         ),
          //         child: Text(
          //           'Back',
          //           style: TextStyle(color: AppColor.primaryColor0),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       height: 40,
          //       width: 90,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(5),
          //           border: Border.all(
          //             color: AppColor.disableTextColor,
          //             width: 2,
          //           )),
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pop(
          //             context,
          //           );
          //         },
          //         style: const ButtonStyle(
          //           elevation: null,
          //           backgroundColor:
          //               MaterialStatePropertyAll(AppColor.scaffoldBackground),
          //         ),
          //         child: Text(
          //           'Cancel',
          //           style: TextStyle(color: AppColor.primaryColor),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       height: 40,
          //       width: 90,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(5),
          //           border: Border.all(
          //             color: AppColor.primaryColor,
          //             width: 2,
          //           )),
          //       child: ElevatedButton(
          //         onPressed: () {
          //           widget.tabController
          //               ?.animateTo(widget.tabController!.index + 1);
          //         },
          //         style: const ButtonStyle(
          //           elevation: null,
          //           backgroundColor:
          //               MaterialStatePropertyAll(AppColor.scaffoldBackground),
          //         ),
          //         child: Text(
          //           'Next',
          //           style: TextStyle(color: AppColor.primaryColor0),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
