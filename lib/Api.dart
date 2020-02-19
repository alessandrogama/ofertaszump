import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutkart/models/categories.dart' as category;
import 'package:flutkart/models/offers.dart' as offer;


//token developer
const token = "1581587484756e74e9fd9";

//developer
const baseUrl = "http://sandbox-api.lomadee.com/v3/";

//soucerId
const sourceId = "36420606";

class Api {

    static Future getCategoryAll() async {
      Dio dio = Dio();
      var url = baseUrl + token + "/category/_all?sourceId=" + sourceId;
      Response response = await dio.get(url);
      return category.Category.fromJson(response.data);
    }
    static Future getCategorySearch(keyword) async {
      Dio dio = Dio();
      var url = baseUrl + token + "/category/_search?sourceId=" + sourceId + "&keyword="+ keyword;
      Response response = await dio.get(url);
      return category.Category.fromJson(response.data);
  }

    static Future getOfferSearchForWord(keyword) async {
      Dio dio = Dio();
      var url = baseUrl + token + "/offer/_search?sourceId=" + sourceId + "&keyword="+ keyword;
      Response response = await dio.get(url);
      return offer.Offer.fromJson(response.data);
  }
  static Future getOfferSearchForIdCategory(idCategory) async {
      Dio dio = Dio();
      var url = baseUrl + token + "/offer/_category/" + idCategory + "?sourceId="+ sourceId;
      print(url);
      Response response = await dio.get(url);
      return offer.Offer.fromJson(response.data);
  }

}