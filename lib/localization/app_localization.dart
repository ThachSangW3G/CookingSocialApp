import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  String localize(String value) {
    final code = AppLocalization.of(this).locale.languageCode;
    final database = AppLocalization._localizedValues;
    if (database.containsKey(code)) {
      return database[code]?[value] ?? "-";
    } else {
      return database['en']?[value] ?? "-";
    }
  }
}

class AppLocalization {
  final Locale locale;

  const AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "title": "Mallika",
      "senOTP": "Send OTP",
      "or": "OR",
      "continueWithApple": "Continue with Apple",

      //Splash 1
      "skip": "Skip",
      "MAKERECIPESYOUROWN": "MAKE RECIPES YOUR OWN",
      "splashDes1": "With Mallika recipe editor, you can easily edit recipes, save adjustments to ingredients, and add additional steps or tips to your preparation.",

      //Splash2
      "allInOnePlace": "All In One Place",
      "splashDes2": "Storing your recipes in Mallika allows you to quickly search, find, and select what you want to cook.",

      //Splash3
      "cookFromYourFavouriteDevice": "Cook From Your Favourite Device",
      "splashDes3": "Mallika stores your recipes in the Cloud so you can access them on any device through our website or Android/iOS app.",
      
      //HomeScreen
      "hi": "Hi",
      "whatareyoucookingtoday?": "What are you cooking today?",
      "cookBooks": "Cookbooks",
      "likes": "Likes",
      "recipes": "Recipes",
      "featuredCommunityRecipes": "Featured Community Recipes",
      "getLotsOfRecipeInspirationFromTheCommunity": "Get lots of recipe inspiration from the community",
      "showAllRecipebyCommunity": "Show All Recipe by Community",
      "category": "Category",

      //Search Screen
      "searchRecipe": "Search Recipe",
      "recentSearch": "Recent Search",
      "lastSeen": "Last Seen",
      "recipeTitle,Ingredient": "Recipe Title, Ingredient",
      
      //Grocery
      "grocery": "Grocery",
      "addNewItem": "Add new item",

      //Calendar
      "calendar": "Calendar",
    },
    "vi": {
      "title": "Mallika",
      "senOTP": "Gửi mã OTP",
      "or": "HOẶC",
      "continueWithApple": "Continue with Apple",

      //Splash 1
      "skip": "Bỏ qua",
      "MAKERECIPESYOUROWN": "Tạo Ra Công Thức Của Riêng Bạn",
      "splashDes1": "With Mallika recipe editor, you can easily edit recipes, save adjustments to ingredients, and add additional steps or tips to your preparation.",

      //Splash2
      "allInOnePlace": "Tất cả đều có thể tạo ra tại đây!",
      "splashDes2": "Storing your recipes in Mallika allows you to quickly search, find, and select what you want to cook.",

      //Splash3
      "cookFromYourFavouriteDevice": "Nấu Ăn Từ Thiết Bị Yêu Thích",
      "splashDes3": "Mallika stores your recipes in the Cloud so you can access them on any device through our website or Android/iOS app.",
      
      //HomeScreen
      "hi": "Xin chào",
      "whatareyoucookingtoday?": "Hôm nay bạn sẽ nấu món nào?",
      "cookBooks": "Tuyển tập công thức nấu ăn",
      "likes": "Yêu thích",
      "recipes": "Công thức",
      "featuredCommunityRecipes": "Những công thức được chia sẻ",
      "getLotsOfRecipeInspirationFromTheCommunity": "Những ý tưởng tuyệt vời đã được mọi người chia sẻ tại đây",
      "showAllRecipebyCommunity": "Xem toàn bộ các công thức",
      "category": "Phân loại",

      //Search Screen
      "searchRecipe": "Tìm kiếm công thức",
      "recentSearch": "Kết quả tìm kiếm",
      "lastSeen": "Đã tìm trước đó",
      "recipeTitle_Ingredient": "Tên công thức, nguyên liệu",

      //Grocery
      "grocery": "Giỏ hàng",
      "addNewItem": "Thêm nguyên liệu",

      //Calendar
      "calendar": "Lịch Nấu Ăn",
      // "calendar": "Calendar",
      // "calendar": "Calendar",
      // "calendar": "Calendar",
      // "calendar": "Calendar",
      // "calendar": "Calendar",
    },
  };
}
