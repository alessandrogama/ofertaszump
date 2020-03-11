import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ofertasZump/models/categories.dart' as category;
import 'package:ofertasZump/models/offers.dart' as offer;
import 'package:ofertasZump/models/coupons.dart' as coupon;


//token developer
const token = "1581587484756e74e9fd9";

//developer
const baseUrlOffers = "http://sandbox-api.lomadee.com/v3/";
const baseUrlCoupon = "http://sandbox-api.lomadee.com/v2/";

//soucerId
const sourceId = "36420606";

class Api {

  //Offers
    static Future getCategoryAll() async {
      Dio dio = Dio();
      var url = baseUrlOffers + token + "/category/_all?sourceId=" + sourceId;
      Response response = await dio.get(url);
      return category.Category.fromJson(response.data);
    }
    static Future getCategorySearch(keyword) async {
      Dio dio = Dio();
      var url = baseUrlOffers + token + "/category/_search?sourceId=" + sourceId + "&keyword="+ keyword;
      Response response = await dio.get(url);
      return category.Category.fromJson(response.data);
  }

    static Future getOfferSearchForWord(keyword) async {
      Dio dio = Dio();
      var url = baseUrlOffers + token + "/offer/_search?sourceId=" + sourceId + "&keyword="+ keyword;
      Response response = await dio.get(url);
      return offer.Offer.fromJson(response.data);
  }
  static Future getOfferSearchForIdCategory(idCategory) async {
      Dio dio = Dio();
      var url = baseUrlOffers + token + "/offer/_category/" + idCategory + "?sourceId="+ sourceId;
      print(url);
      Response response = await dio.get(url);
      return offer.Offer.fromJson(response.data);
  }
  //Coupons
  static Future getStoreCoupon() async {
      Dio dio = Dio();
      var url = baseUrlCoupon + token + "/coupon/_stores?sourceId=" + sourceId ;
      print(url);
      Response response = await dio.get(url);
      return coupon.Coupon.fromJson(response.data);
  }

}