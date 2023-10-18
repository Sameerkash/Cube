// To parse this JSON data, do
//
//     final orderObject = orderObjectFromJson(jsonString);

import 'dart:convert';

OrderObject orderObjectFromJson(String str) => OrderObject.fromJson(json.decode(str));

String orderObjectToJson(OrderObject data) => json.encode(data.toJson());

class OrderObject {
  String? id;
  String? locationId;
  Money? totalMoney;
  NetAmounts? netAmounts;
  Source? source;

  OrderObject({
    required this.id,
    required this.locationId,
    required this.totalMoney,
    required this.netAmounts,
    required this.source,
  });

  factory OrderObject.fromJson(Map<String, dynamic> json) => OrderObject(
    id: json["id"],
    locationId: json["location_id"],
    totalMoney: Money.fromJson(json["total_money"]),
    netAmounts: NetAmounts.fromJson(json["net_amounts"]),
    source: Source.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "location_id": locationId,
    "total_service_charge_money": totalMoney?.toJson(),
    "net_amounts": netAmounts?.toJson(),
    "source": source?.toJson(),
  };
}

class LineItem {
  String uid;
  String quantity;
  Money basePriceMoney;
  Money grossSalesMoney;
  Money totalTaxMoney;
  Money totalDiscountMoney;
  Money totalMoney;
  Money variationTotalPriceMoney;
  String itemType;
  Money totalServiceChargeMoney;

  LineItem({
    required this.uid,
    required this.quantity,
    required this.basePriceMoney,
    required this.grossSalesMoney,
    required this.totalTaxMoney,
    required this.totalDiscountMoney,
    required this.totalMoney,
    required this.variationTotalPriceMoney,
    required this.itemType,
    required this.totalServiceChargeMoney,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    uid: json["uid"],
    quantity: json["quantity"],
    basePriceMoney: Money.fromJson(json["base_price_money"]),
    grossSalesMoney: Money.fromJson(json["gross_sales_money"]),
    totalTaxMoney: Money.fromJson(json["total_tax_money"]),
    totalDiscountMoney: Money.fromJson(json["total_discount_money"]),
    totalMoney: Money.fromJson(json["total_money"]),
    variationTotalPriceMoney: Money.fromJson(json["variation_total_price_money"]),
    itemType: json["item_type"],
    totalServiceChargeMoney: Money.fromJson(json["total_service_charge_money"]),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "quantity": quantity,
    "base_price_money": basePriceMoney.toJson(),
    "gross_sales_money": grossSalesMoney.toJson(),
    "total_tax_money": totalTaxMoney.toJson(),
    "total_discount_money": totalDiscountMoney.toJson(),
    "total_money": totalMoney.toJson(),
    "variation_total_price_money": variationTotalPriceMoney.toJson(),
    "item_type": itemType,
    "total_service_charge_money": totalServiceChargeMoney.toJson(),
  };
}

class Money {
  int amount;
  Currency currency;

  Money({
    required this.amount,
    required this.currency,
  });

  factory Money.fromJson(Map<String, dynamic> json) => Money(
    amount: json["amount"],
    currency: currencyValues.map[json["currency"]]!,
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currencyValues.reverse[currency],
  };
}

enum Currency {
  USD
}

final currencyValues = EnumValues({
  "USD": Currency.USD
});

class NetAmounts {
  Money totalMoney;
  Money taxMoney;
  Money discountMoney;
  Money tipMoney;
  Money serviceChargeMoney;

  NetAmounts({
    required this.totalMoney,
    required this.taxMoney,
    required this.discountMoney,
    required this.tipMoney,
    required this.serviceChargeMoney,
  });

  factory NetAmounts.fromJson(Map<String, dynamic> json) => NetAmounts(
    totalMoney: Money.fromJson(json["total_money"]),
    taxMoney: Money.fromJson(json["tax_money"]),
    discountMoney: Money.fromJson(json["discount_money"]),
    tipMoney: Money.fromJson(json["tip_money"]),
    serviceChargeMoney: Money.fromJson(json["service_charge_money"]),
  );

  Map<String, dynamic> toJson() => {
    "total_money": totalMoney.toJson(),
    "tax_money": taxMoney.toJson(),
    "discount_money": discountMoney.toJson(),
    "tip_money": tipMoney.toJson(),
    "service_charge_money": serviceChargeMoney.toJson(),
  };
}

class Source {
  String name;

  Source({
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Tender {
  String id;
  String locationId;
  String transactionId;
  DateTime createdAt;
  Money amountMoney;
  String type;
  CardDetails cardDetails;
  String paymentId;

  Tender({
    required this.id,
    required this.locationId,
    required this.transactionId,
    required this.createdAt,
    required this.amountMoney,
    required this.type,
    required this.cardDetails,
    required this.paymentId,
  });

  factory Tender.fromJson(Map<String, dynamic> json) => Tender(
    id: json["id"],
    locationId: json["location_id"],
    transactionId: json["transaction_id"],
    createdAt: DateTime.parse(json["created_at"]),
    amountMoney: Money.fromJson(json["amount_money"]),
    type: json["type"],
    cardDetails: CardDetails.fromJson(json["card_details"]),
    paymentId: json["payment_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "location_id": locationId,
    "transaction_id": transactionId,
    "created_at": createdAt.toIso8601String(),
    "amount_money": amountMoney.toJson(),
    "type": type,
    "card_details": cardDetails.toJson(),
    "payment_id": paymentId,
  };
}

class CardDetails {
  String status;
  Card card;
  String entryMethod;

  CardDetails({
    required this.status,
    required this.card,
    required this.entryMethod,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) => CardDetails(
    status: json["status"],
    card: Card.fromJson(json["card"]),
    entryMethod: json["entry_method"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "card": card.toJson(),
    "entry_method": entryMethod,
  };
}

class Card {
  String cardBrand;
  String last4;
  String fingerprint;

  Card({
    required this.cardBrand,
    required this.last4,
    required this.fingerprint,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    cardBrand: json["card_brand"],
    last4: json["last_4"],
    fingerprint: json["fingerprint"],
  );

  Map<String, dynamic> toJson() => {
    "card_brand": cardBrand,
    "last_4": last4,
    "fingerprint": fingerprint,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
