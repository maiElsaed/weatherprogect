Map<String, String> citiesMap = {
  'القاهرة': 'Cairo',
  'الإسكندرية': 'Alexandria',
  'الجيزة': 'Giza',
  'شرم الشيخ': 'Sharm El Sheikh',
  'الأقصر': 'Luxor',
  'أسوان': 'Aswan',
  'السويس': 'Suez',
  'بورسعيد': 'Port Said',
  'المنصورة': 'Mansoura',
  'طنطا': 'Tanta',
  'دمياط': 'Damietta',
  'الغردقة': 'Hurghada',
  'الإسماعيلية': 'Ismailia',
  'أسيوط': 'Assiut',
  'الزقازيق': 'Zagazig',
  'بنها': 'Banha',
  'دمنهور': 'Damanhur',
  'الفيوم': 'Faiyum',
  'العريش': 'Arish',
  'مرسى مطروح': 'Marsa Matruh',
  'بني سويف': 'Beni Suef',
  'المنوفية': 'المنوفيه'
};
String translateCityName(String arabicCityName) {
  if (citiesMap.containsKey(arabicCityName)) {
    return citiesMap[arabicCityName]!;
  } else {
    return arabicCityName;  // إذا كانت المدينة غير موجودة في القائمة
  }
}


