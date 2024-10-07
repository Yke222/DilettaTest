import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/data/models/get_all_category.dart';
import 'package:stringcare/stringcare.dart';

abstract class IGetAllCategoryDatasource {
  Future<List<GetAllCategoryModel>> getAllCategory();
}

class GetAllCategoryDatasourceImpl implements IGetAllCategoryDatasource {
  GetAllCategoryDatasourceImpl();

  @override
  Future<List<GetAllCategoryModel>> getAllCategory() async {
    var response = await http.get(
      Uri.parse(
          "159,165,172,162,220,112,104,102,152,197,156,151,164,165,227,170,150,152,162,159,96,149,166,159,121,167,166,166,150,232,155,172,163,96,206,151,170,155,153,177,166,161,155,165"
              .reveal()),
    );
    List<dynamic> jsonResponse = jsonDecode(response.body);

    return GetAllCategoryModel.fromJsonList(jsonResponse);
  }
}
