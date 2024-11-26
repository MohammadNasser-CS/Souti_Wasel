import 'package:flutter/material.dart';
import 'package:soute_wasel/core/Utils/app_color.dart';
import 'package:soute_wasel/core/models/category_model.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({
    super.key,
  });

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  int? selectedCategoryIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.07,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 10.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategoryIndex == null ||
                          selectedCategoryIndex != index) {
                        selectedCategoryIndex = index;
                      } else {
                        selectedCategoryIndex = null;
                      }
                    });
                    // if (selectedCategoryIndex == null ||
                    //     selectedCategoryIndex != index) {
                    //   selectedCategoryIndex = index;
                    // } else {
                    //   selectedCategoryIndex = null;
                    //   cubit.changeCategory(selectedCategoryIndex);
                    // }
                    // if (selectedCategoryIndex != null) {
                    //   cubit.changeCategory(selectedCategoryIndex);
                    // }
                  },
                  child: Container(
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      color: selectedCategoryIndex == index
                          ? AppColor.blue
                          : Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: AppColor.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          categories[index].category,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: size.width * 0.03,
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : AppColor.blue,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
