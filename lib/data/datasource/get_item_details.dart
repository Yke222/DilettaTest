import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/data/models/get_item_details.dart';

abstract class IItemDetailsDatasource {
  Future<List<GetItemDetailsModel>> getItemDetails(String category);
}

class ItemDetailsDatasourceImpl implements IItemDetailsDatasource {
  ItemDetailsDatasourceImpl();

  @override
  Future<List<GetItemDetailsModel>> getItemDetails(String category) async {
    var response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/category/$category"),
    );
    List<dynamic> jsonResponse = jsonDecode(response.body);

    Map<String, dynamic> mapa = {};
    for (int i = 0; i < jsonResponse.length; i++) {
      mapa[i.toString()] = jsonResponse[i];
    }

    return GetItemDetailsModel.itemDeatilsFromMap(mapa);
  }
}
