class OfferModel {
  Data? data;
  String? message;
  List<String>? error;
  int? status;

  OfferModel({this.data, this.message, this.error, this.status});

  OfferModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = <String>[];
      json['error'].forEach((v) {
        error!.add(v);
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.map((v) => v).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  List<Offers>? offers;

  Data({this.offers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  List<PriceOffers>? priceOffers;

  Offers({this.priceOffers});

  Offers.fromJson(Map<String, dynamic> json) {
    if (json['price_offers'] != null) {
      priceOffers = <PriceOffers>[];
      json['price_offers'].forEach((v) {
        priceOffers!.add(PriceOffers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (priceOffers != null) {
      data['price_offers'] = priceOffers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PriceOffers {
  int? id;
  int? orderId;
  int? deliveryId;
  String? price;
  ///TODO : Null
  Null? message;
  String? status;
  String? createdAt;
  String? updatedAt;

  PriceOffers(
      {this.id,
        this.orderId,
        this.deliveryId,
        this.price,
        this.message,
        this.status,
        this.createdAt,
        this.updatedAt});

  PriceOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    deliveryId = json['delivery_id'];
    price = json['price'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['delivery_id'] = deliveryId;
    data['price'] = price;
    data['message'] = message;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
