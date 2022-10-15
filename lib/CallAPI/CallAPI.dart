import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:musicapplication/Values/AppUrl.dart';

import '../Models/QuangCao.dart';
import '../Models/BaiHat.dart';
import '../Models/TheLoai.dart';

class CallAPI{
  static getQuangCao(List<QuangCao> list) async{
      var dio =await Dio().get(AppURL.getQuangCaoUrl);
      if(list.isEmpty){
        dio.data.forEach((item)=> list.add(new QuangCao.fromJson(item)));
      }else{
        list.clear();
        dio.data.forEach((item)=> list.add(new QuangCao.fromJson(item)));
      }
  }
  static getBaiHat(List<BaiHat> list) async{
    var dio =await Dio().get(AppURL.getBaiHatUrl);
    if(list.isEmpty){
      dio.data.forEach((item)=> list.add(new BaiHat.fromJson(item)));
    }else{
      list.clear();
      dio.data.forEach((item)=> list.add(new BaiHat.fromJson(item)));
    }
  }
  static getTheLoai(List<TheLoai> list) async{
    var dio =await Dio().get(AppURL.getTheLoaiUrl);
    if(list.isEmpty){
      dio.data.forEach((item)=> list.add(new TheLoai.fromJson(item)));
    }else{
      list.clear();
      dio.data.forEach((item)=> list.add(new TheLoai.fromJson(item)));
    }
  }
}