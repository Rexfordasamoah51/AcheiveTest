import 'dart:convert';

AssetsResponseModel assetsResponseModelFromJson(String str) =>
    AssetsResponseModel.fromJson(json.decode(str));

String assetsResponseModelToJson(AssetsResponseModel data) =>
    json.encode(data.toJson());

class AssetsResponseModel {
  AssetsResponseModel({required this.data});

  List<dynamic> data = [];
  factory AssetsResponseModel.fromJson(Map<String, dynamic> json) =>
      AssetsResponseModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}
