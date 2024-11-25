import 'package:flutter/material.dart';
import 'package:soute_wasel/Utils/app_color.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // DecoratedBox(
        //   decoration: const BoxDecoration(
        //       border:
        //           BorderDirectional(bottom: BorderSide(color: AppColor.blue))),
        //   child: TextButton(
        //       onPressed: () {
        //         debugPrint('test');
        //       },
        //       child: Text(
        //         'كل التمارين',
        //         style: Theme.of(context).textTheme.labelMedium!.copyWith(
        //             fontWeight: FontWeight.w900, color: AppColor.black),
        //       )),
        // ),
        Text(
          'اختر تمرين',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w900, color: AppColor.black),
        ),
      ],
    );
  }
}
