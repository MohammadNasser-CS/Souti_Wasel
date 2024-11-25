import 'package:flutter/material.dart';
import 'package:soute_wasel/Views/bottom_navbar/widgets/title_value_widget.dart';

class AppBarTitleForUser extends StatelessWidget {
  final int index;
  const AppBarTitleForUser({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? const TitleValueWidget(text: 'الصفحة الرئيسية')
        : index == 1
            ? const TitleValueWidget(text: 'المفضلة')
            : index == 2
                ? const TitleValueWidget(text: 'حسابي')
                : const SizedBox.shrink();
  }
}
