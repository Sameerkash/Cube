// To parse this JSON data, do
//
//     final catalogObject = catalogObjectFromJson(jsonString);

import 'dart:convert';

import 'package:cube/core/networking/networking.dart';

class CatalogObjectList extends BaseModel {
  List<CatalogObject>? catalog;

  CatalogObjectList({required this.catalog});

  CatalogObjectList.empty();

  @override
  fromJson(Map<String, dynamic> json) => CatalogObjectList(
      catalog : List<CatalogObject>.from(json['objects'].map((x) {
        CatalogObject object = CatalogObject.fromJson(x);
      return object;})
  ));
}

CatalogObject catalogObjectFromJson(String str) => CatalogObject.fromJson(json.decode(str));

String catalogObjectToJson(CatalogObject data) => json.encode(data.toJson());

class CatalogObject {
  String? type;
  String? id;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? version;
  bool? isDeleted;
  bool? presentAtAllLocations;
  CatalogItemData? itemData;
  ItemVariationData? itemVariationData;

  CatalogObject({
    required this.type,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.version,
    required this.isDeleted,
    required this.presentAtAllLocations,
    this.itemData,
    this.itemVariationData,
  });

  CatalogObject.empty();

  factory CatalogObject.fromJson(Map<String, dynamic> json) => CatalogObject(
    type: json["type"],
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    version: json["version"],
    isDeleted: json["is_deleted"],
    presentAtAllLocations: json["present_at_all_locations"],
    itemData: json["item_data"] == null ? null : CatalogItemData.fromJson(json["item_data"]),
    itemVariationData: json["item_variation_data"] == null ? null : ItemVariationData.fromJson(json["item_variation_data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "version": version,
    "is_deleted": isDeleted,
    "present_at_all_locations": presentAtAllLocations,
    "item_data": itemData?.toJson(),
    "item_variation_data": itemVariationData?.toJson(),
  };

  @override
  fromJson(Map<String,dynamic> json) {
    return CatalogObject(
      type: json["type"],
      id: json["id"],
      updatedAt: DateTime.parse(json["updated_at"] ?? ""),
      createdAt: DateTime.parse(json["created_at"] ?? ""),
      version: json["version"],
      isDeleted: json["is_deleted"],
      presentAtAllLocations: json["present_at_all_locations"],
      itemData: json["item_data"] == null ? null : CatalogItemData.fromJson(json["item_data"]),
      itemVariationData: json["item_variation_data"] == null ? null : ItemVariationData.fromJson(json["item_variation_data"]),
    );
  }
}

class CatalogItemData {
  String? name;
  String? description;
  String? abbreviation;
  bool? isTaxable;
  List<CatalogObject?> variations;
  String? productType;
  List<String?> imageIds;
  String? descriptionHtml;
  String? descriptionPlaintext;
  bool? isArchived;

  CatalogItemData({
    required this.name,
    required this.description,
    required this.abbreviation,
    required this.isTaxable,
    required this.variations,
    required this.productType,
    required this.imageIds,
    required this.descriptionHtml,
    required this.descriptionPlaintext,
    required this.isArchived,
  });

  factory CatalogItemData.fromJson(Map<String, dynamic> json) =>
      CatalogItemData(
        name: json["name"],
        description: json["description"],
        abbreviation: json["abbreviation"],
        isTaxable: json["is_taxable"],
        variations: List<CatalogObject>.from(
            json["variations"].map((x) => CatalogObject.fromJson(x))),
        productType: json["product_type"],
        imageIds: (json["image_ids"] != null) ? List<String>.from(json["image_ids"].map((x) => x)) : [],
        descriptionHtml: json["description_html"],
        descriptionPlaintext: json["description_plaintext"],
        isArchived: json["is_archived"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "description": description,
        "abbreviation": abbreviation,
        "is_taxable": isTaxable,
        "variations": List<dynamic>.from(variations.map((x) => x?.toJson())),
        "product_type": productType,
        "image_ids": List<dynamic>.from(imageIds.map((x) => x)),
        "description_html": descriptionHtml,
        "description_plaintext": descriptionPlaintext,
        "is_archived": isArchived,
      };
}

class ItemVariationData {
  String itemId;
  String name;
  int ordinal;
  String pricingType;
  bool sellable;
  bool stockable;
  PriceMoney? priceMoney;

  ItemVariationData({
    required this.itemId,
    required this.name,
    required this.ordinal,
    required this.pricingType,
    required this.sellable,
    required this.stockable,
    this.priceMoney,
  });

  factory ItemVariationData.fromJson(Map<String, dynamic> json) => ItemVariationData(
    itemId: json["item_id"],
    name: json["name"],
    ordinal: json["ordinal"],
    pricingType: json["pricing_type"],
    sellable: json["sellable"],
    stockable: json["stockable"],
    priceMoney: json["price_money"] == null ? null : PriceMoney.fromJson(json["price_money"]),
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "name": name,
    "ordinal": ordinal,
    "pricing_type": pricingType,
    "sellable": sellable,
    "stockable": stockable,
    "price_money": priceMoney?.toJson(),
  };
}

class PriceMoney {
  int amount;
  String currency;

  PriceMoney({
    required this.amount,
    required this.currency,
  });

  factory PriceMoney.fromJson(Map<String, dynamic> json) => PriceMoney(
    amount: json["amount"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
  };
}
