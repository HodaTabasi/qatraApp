class Product {
  int id;
  String name;
  String description;
  var price;
  var discount;
  String startDiscountDate;
  String endDiscountDate;
  var countCartoons;
  bool isHidden;
  var minPurchase;
  String createdAt;
  String updatedAt;

  Product(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.discount,
        this.startDiscountDate,
        this.endDiscountDate,
        this.countCartoons,
        this.isHidden,
        this.createdAt,
        this.minPurchase,
        this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    startDiscountDate = json['start_discount_date'];
    endDiscountDate = json['end_discount_date'];
    countCartoons = json['count_cartoons'];
    isHidden = json['is_hidden'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    minPurchase = json['min_purchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['start_discount_date'] = this.startDiscountDate;
    data['end_discount_date'] = this.endDiscountDate;
    data['count_cartoons'] = this.countCartoons;
    data['is_hidden'] = this.isHidden;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['min_purchase'] = this.minPurchase;
    return data;
  }
}