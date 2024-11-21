import 'dart:convert';

class HomeDataModel {
    final List<CategoryList>? categoryList;
    final List<String>? videosList;

    HomeDataModel({
        this.categoryList,
        this.videosList,
    });

    factory HomeDataModel.fromJson(String str) => HomeDataModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HomeDataModel.fromMap(Map<String, dynamic> json) => HomeDataModel(
        categoryList: json["category_list"] == null ? [] : List<CategoryList>.from(json["category_list"]!.map((x) => CategoryList.fromMap(x))),
        videosList: json["videos_list"] == null ? [] : List<String>.from(json["videos_list"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "category_list": categoryList == null ? [] : List<dynamic>.from(categoryList!.map((x) => x.toMap())),
        "videos_list": videosList == null ? [] : List<dynamic>.from(videosList!.map((x) => x)),
    };
}

class CategoryList {
    final String? name;
    final int? id;
    final String? icon;
    final List<CategoryList>? subCategory;

    CategoryList({
        this.name,
        this.id,
        this.icon,
        this.subCategory,
    });

    factory CategoryList.fromJson(String str) => CategoryList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
        name: json["Name"],
        id: json["id"],
        icon: json["Icon"],
        subCategory: json["sub_category"] == null ? [] : List<CategoryList>.from(json["sub_category"]!.map((x) => CategoryList.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "Name": name,
        "id": id,
        "Icon": icon,
        "sub_category": subCategory == null ? [] : List<dynamic>.from(subCategory!.map((x) => x.toMap())),
    };
}
