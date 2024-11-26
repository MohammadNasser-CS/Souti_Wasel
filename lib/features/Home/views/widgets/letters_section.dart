import 'package:flutter/material.dart';
import 'package:soute_wasel/core/Utils/app_color.dart';
import 'package:soute_wasel/core/Utils/letter_list.dart';

class LettersSection extends StatefulWidget {
  const LettersSection({super.key});

  @override
  State<LettersSection> createState() => _LettersSectionState();
}

class _LettersSectionState extends State<LettersSection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: 1,
              ),
              itemCount: letterList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      debugPrint("test");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.grey1,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Center(
                            child: Text(
                              letterList[index], // Arabic letter
                              style: TextStyle(
                                fontSize: size.height *
                                    0.1, // Adjust font size as needed
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue,
                              ),
                              textAlign: TextAlign.center, // Center the text
                            ),
                          ),
                          PositionedDirectional(
                            bottom: 0,
                            start: 0,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.navigate_before_outlined,
                                color: AppColor.blue,
                                size: size.height * 0.05,
                                // filterdProducts[index].isFavorite == false
                                //     ? Icons.check_box_outlined
                                //     : Icons.favorite,
                                // color: Colors.deepOrange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
