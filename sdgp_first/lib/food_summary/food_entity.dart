class FoodEntity{
  String? time;
  String? date;
  double? carbs;
  double? protein;
  double? fiber;
  double? fats;
  double? calories;
  double? bglBefore;
  double? bglAfter;

  FoodEntity({required this.time,required this.date, required this.carbs, required this.protein, required this.fiber, required this.fats,
    required this.calories, required this.bglBefore, required this.bglAfter});
}