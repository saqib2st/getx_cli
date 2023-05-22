
import 'package:flutter/material.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';




class PersonalInfo extends StatefulWidget {
  const PersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // final counter = Provider.of<SignUpProvider>(context);
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
            'Personal Information',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.tabColor),
          ),
          const Text('Enter some Information about yourself'),
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
          Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appGrey, width: 2.0),
                    ),
                    hintText: 'e.g. Jhon',
                  ),
                ),
              ),
              const SizedBox(
                  width: 40), // add some space between the text fields
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appGrey, width: 2.0),
                    ),
                    hintText: 'e.g. Doe',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Frist Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 38,
              ),
              Expanded(
                child: Text(
                  'Last Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.appGrey, width: 2.0),
                ),
                hintText: 'e.g. SomeStreet91'),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 220),
        ],
      ),
    );
  }
}
