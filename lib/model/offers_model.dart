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
        error!.add((v));
      });
    }
    status = json['status'];
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
}

class PriceOffers {
  int? id;
  int? orderId;
  int? deliveryId;
  String? price;
  String? message;
  String? status;
  String? createdAt;
  String? updatedAt;
  Delivery? delivery;

  PriceOffers(
      {this.id,
      this.orderId,
      this.deliveryId,
      this.price,
      this.message,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.delivery});

  PriceOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    deliveryId = json['delivery_id'];
    price = json['price'];
    message = json['message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    delivery =
        json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null;
  }
}

class Delivery {
  int? id;
  String? name;
  String? email;
  String? nationalId;
  String? nationalFront;
  String? licenseImg;
  String? image;
  String? gender;
  int? vehicleId;
  String? companyName;
  String? phone;
  String? extraPhone;
  String? address;
  String? emailVerifiedAt;
  String? type;
  String? status;
  String? lastOfferTime;
  String? createdAt;
  String? updatedAt;

  Delivery(
      {this.id,
      this.name,
      this.email,
      this.nationalId,
      this.nationalFront,
      this.licenseImg,
      this.image,
      this.gender,
      this.vehicleId,
      this.companyName,
      this.phone,
      this.extraPhone,
      this.address,
      this.emailVerifiedAt,
      this.type,
      this.status,
      this.lastOfferTime,
      this.createdAt,
      this.updatedAt});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nationalId = json['national_id'];
    nationalFront = json['national_front'];
    licenseImg = json['license_img'];
    image = json['image'];
    gender = json['gender'];
    vehicleId = json['vehicle_id'];
    companyName = json['company_name'];
    phone = json['phone'];
    extraPhone = json['extra_phone'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    status = json['status'];
    lastOfferTime = json['last_offer_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
