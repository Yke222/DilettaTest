// ignore: constant_identifier_names
enum CategoryEnum { ELECTRONICS, JEWELERY, MEN_S_CLOTHING, WOMEN_S_CLOTHING }

class CategoryUtils {
  static CategoryEnum getCategoryEnumFromString(String categoryString) {
    switch (categoryString) {
      case "electronics":
        return CategoryEnum.ELECTRONICS;
      case "jewelery":
        return CategoryEnum.JEWELERY;
      case "men's clothing":
        return CategoryEnum.MEN_S_CLOTHING;
      case "women's clothing":
        return CategoryEnum.WOMEN_S_CLOTHING;
      default:
        throw Exception("Category unknown: $categoryString");
    }
  }

  static String getCategoryStringFromEnum(CategoryEnum categoryEnum) {
    switch (categoryEnum) {
      case CategoryEnum.ELECTRONICS:
        return "electronics";
      case CategoryEnum.JEWELERY:
        return "jewelery";
      case CategoryEnum.MEN_S_CLOTHING:
        return "men's clothing";
      case CategoryEnum.WOMEN_S_CLOTHING:
        return "women's clothing";
      default:
        return "";
    }
  }

}