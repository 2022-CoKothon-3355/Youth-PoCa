import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youth_poca/model/poca_info.dart';
import 'package:youth_poca/pages/main_page.dart';

import '../config.dart';

class APIService {
  static var client = http.Client();

  static Future<List<PocaInfo>?> getPocas() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.pocasAPI,
    );

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return pocasFromJson(data["data"]);

      //return true;
    } else {
      return null;
    }
  }

  static Future<bool> savePoca(
    PocaInfo model,
    bool isEditMode,
    bool isFileSelected,
  ) async {
    var pocaURL = Config.pocasAPI;

    if (isEditMode) {
      pocaURL = pocaURL + "/" + model.pocaID.toString();
    }

    var url = Uri.http(Config.apiURL, pocaURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    var request = http.MultipartRequest(requestMethod, url);
    request.fields["ownerID"] = model.ownerID;
    request.fields["name"] = model.name;
    request.fields["email"] = model.email;
    request.fields["phoneNum"] = model.phoneNum!;
    request.fields["address"] = model.address!;
    request.fields["activity"] = model.activity!;
    request.fields["description"] = model.description!;
    request.fields["progress"] = model.progress!;
    // request.fields["isRepresent"] = model.isRepresent!.toString();
    request.fields["result"] = model.result!;
    request.fields["sendTime"] = model.sendTime!;

    // 포트폴리오 부분 완성되면 아래 주석 풀어서 하면 됨
    request.fields["images"] = model.images.toString();
    request.fields["contents"] = model.contents.toString();

    // if (model.images != null && isFileSelected) {
    //   http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //     'images',
    //     model.images!,
    //   );

    //   request.files.add(multipartFile);
    // }

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteProduct(pocaID) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.pocasAPI + "/" + pocaID,
    );

    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Widget loadPocas() {
  //   return FutureBuilder(
  //       future: APIService.getPocas(),
  //       builder: (BuildContext context, AsyncSnapshot<List<PocaInfo>?> model) {
  //         if (model.hasData) {
  //           // MainPage 수정이 필요한 부분
  //           return MainPage(model.data);
  //         }

  //         return const Center(child: CircularProgressIndicator())
  //       });
  // }
}
