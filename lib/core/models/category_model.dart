class ExceriseCategoryModel {
  final String categoryId;
  final String category;
  final bool isSelected;
  ExceriseCategoryModel({
    required this.categoryId,
    required this.category,
     this.isSelected=false,
  });
}

List<ExceriseCategoryModel> categories = [
  ExceriseCategoryModel(
    categoryId: '1',
    category: 'الكل',
  ),
  ExceriseCategoryModel(
    categoryId: '2',
    category: 'المكتملة',
  ),
  ExceriseCategoryModel(
    categoryId: '3',
    category: 'المتبقية',
  ),
];