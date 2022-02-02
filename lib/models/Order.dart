class Order {
  int _id;
  var _orderNo;
  var _userId;
  var _mosqueType;
  String _status;
  var _quantity;
  var _mosqueId;
  var _receiverId;
  var _productId;
  var _driverId;
  String _image;
  String _createdAt;
  String _updatedAt;
  var _finalPrice;
  var _priceBeforeDiscount;
  var _priceAfterDiscount;
  String _productName;
  String _productDescription;
  var _countCartoons;
  String _mosqueName;
  String _receiverName = " ";
  String _receiverPhone = " ";

  Order({ int id,
    var orderNo,
    var userId,
    var mosqueType,
    String status,
    var quantity,
    var mosqueId,
    var receiverId,
    var productId,
    var driverId,
    String image,
    String createdAt,
    String updatedAt,
    var finalPrice,
    var priceBeforeDiscount,
    var priceAfterDiscount,
    String productName,
    String productDescription,
    var countCartoons,
    String mosqueName,
    String receiverName,
    String receiverPhone
  }) {
    this._id = id;
    this._orderNo = orderNo;
    this._userId = userId;
    this._mosqueType = mosqueType;
    this._status = status;
    this._quantity = quantity;
    this._mosqueId = mosqueId;
    this._receiverId = receiverId;
    this._productId =productId;
    this._driverId = driverId;
    this._image = image;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._finalPrice =finalPrice;
    this._priceBeforeDiscount =priceBeforeDiscount;
    this._priceAfterDiscount = priceAfterDiscount;
    this._productName = productName;
    this._productDescription = productDescription;
    this._countCartoons = countCartoons;
    this._mosqueName = mosqueName;
    this._receiverName = receiverName;
    this._receiverPhone = receiverPhone;
  }



  Order.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _orderNo = json['order_no'];
    _userId = json['user_id'];
    _mosqueType = json['mosque_type'];
    _status = json['status'];
    _quantity = json['quantity'];
    _mosqueId = json['mosque_id'];
    _receiverId = json['receiver_id'];
    _productId = json['product_id'];
    _driverId = json['driver_id'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _finalPrice = json['final_price'];
    _priceBeforeDiscount = json['price_before_discount'];
    _priceAfterDiscount = json['price_after_discount'];
    _productName = json['product_name'];
    _productDescription = json['product_description'];
    _countCartoons = json['count_cartoons'];
    _mosqueName = json['mosque_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['order_no'] = this._orderNo;
    data['user_id'] = this._userId;
    data['mosque_type'] = this._mosqueType;
    data['status'] = this._status;
    data['quantity'] = this._quantity;
    data['mosque_id'] = this._mosqueId;
    data['receiver_id'] = this._receiverId;
    data['product_id'] = this._productId;
    data['driver_id'] = this._driverId;
    data['image'] = this._image;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['final_price'] = this._finalPrice;
    data['price_before_discount'] = this._priceBeforeDiscount;
    data['price_after_discount'] = this._priceAfterDiscount;
    data['product_name'] = this._productName;
    data['product_description'] = this._productDescription;
    data['count_cartoons'] = this._countCartoons;
    data['mosque_name'] = this._mosqueName;
    data['receiver_name'] = this._receiverName;
    data['receiver_phone'] = this._receiverPhone;
    return data;
  }

  Map<String, dynamic> toJsonWithout() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['order_no'] = this._orderNo;
    data['user_id'] = this._userId;
    data['mosque_type'] = this._mosqueType;
    data['status'] = this._status;
    data['quantity'] = this._quantity;
    data['mosque_id'] = this._mosqueId;
    data['receiver_id'] = this._receiverId;
    data['product_id'] = this._productId;
    data['driver_id'] = this._driverId;
    data['image'] = this._image;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['final_price'] = this._finalPrice;
    data['price_before_discount'] = this._priceBeforeDiscount;
    data['price_after_discount'] = this._priceAfterDiscount;
    data['product_name'] = this._productName;
    data['product_description'] = this._productDescription;
    data['count_cartoons'] = this._countCartoons;
    data['mosque_name'] = this._mosqueName;
    return data;
  }

  get orderNo => _orderNo;

  set orderNo(value) {
    _orderNo = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  get userId => _userId;

  set userId(value) {
    _userId = value;
  }

  get mosqueType => _mosqueType;

  set mosqueType(value) {
    _mosqueType = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  get quantity => _quantity;

  set quantity(value) {
    _quantity = value;
  }

  get mosqueId => _mosqueId;

  set mosqueId(value) {
    _mosqueId = value;
  }

  get receiverId => _receiverId;

  set receiverId(value) {
    _receiverId = value;
  }

  get productId => _productId;

  set productId(value) {
    _productId = value;
  }

  get driverId => _driverId;

  set driverId(value) {
    _driverId = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get createdAt => _createdAt;

  set createdAt(String value) {
    _createdAt = value;
  }

  String get updatedAt => _updatedAt;

  set updatedAt(String value) {
    _updatedAt = value;
  }

  get finalPrice => _finalPrice;

  set finalPrice(value) {
    _finalPrice = value;
  }

  get priceBeforeDiscount => _priceBeforeDiscount;

  set priceBeforeDiscount(value) {
    _priceBeforeDiscount = value;
  }

  get priceAfterDiscount => _priceAfterDiscount;

  set priceAfterDiscount(value) {
    _priceAfterDiscount = value;
  }

  String get productName => _productName;

  set productName(String value) {
    _productName = value;
  }

  String get productDescription => _productDescription;

  set productDescription(String value) {
    _productDescription = value;
  }

  get countCartoons => _countCartoons;

  set countCartoons(value) {
    _countCartoons = value;
  }

  String get mosqueName => _mosqueName;

  set mosqueName(String value) {
    _mosqueName = value;
  }

  String get receiverName => _receiverName;

  set receiverName(String value) {
    _receiverName = value;
  }

  String get receiverPhone => _receiverPhone;

  set receiverPhone(String value) {
    _receiverPhone = value;
  }

  @override
  String toString() {
    // return 'Order have _id: $_id, _orderNo: $_orderNo, _userId: $_userId, _mosqueType: $_mosqueType, _status: $_status, _quantity: $_quantity, _mosqueId: $_mosqueId, _receiverId: $_receiverId, _productId: $_productId, _driverId: $_driverId, _image: $_image, _createdAt: $_createdAt, _updatedAt: $_updatedAt, _finalPrice: $_finalPrice, _priceBeforeDiscount: $_priceBeforeDiscount, _priceAfterDiscount: $_priceAfterDiscount, _productName: $_productName, _productDescription: $_productDescription, _countCartoons: $_countCartoons, _mosqueName: $_mosqueName, _receiverName: $_receiverName, _receiverPhone: $_receiverPhone';
    // return '''
    //       $orderNo لقد قمت بارسال طلب  رقم
    //           $productName  و سعر المنتج
    //           $finalPrice اسم المنتج
    //          سيتم ارساله الي المسجد الذي رقمه$mosqueId
    //        واسمه $mosqueName
    //        وبيانات المسجد في الموقع يحتوي على الاحداثيات
    //        ونوع المسجد  $mosqueType
    //        وحالة الطلب $status
    //        تابع للمستخدم صاحب الرقم$userId
    //        عدد البضاعة $quantity
    //        رقم مستلم البضاعة $receiverPhone
    // ''';

    return '''
       |  $orderNo لقد قمت بارسال طلب بالرقم : 
       |  $productName بمنتج تحت مسمى : 
       |  $finalPrice ولقد كان السعر النهائي للمنتج : 
       |  $mosqueName سيتم ارسال الطلب للمسجد صاحب الاسم : 
       |  $mosqueId الذي يحمل الرقم : 
       |  $mosqueType ونوع المسجد هكذا 1 تعبيرا لمصلى الرجال و 0 تعبيرا لمصلى نساء : 
       |  $receiverPhone سيتم استقبال الطلب من قبل الشخص صاحب رقم هاتف : 
       |  $userId الذي يحمل رقم مستخدم بالتسلسل :
       |  $quantity  المنتجات تحمل عددا معينان وهو : 
       |  $status والطلب تحت الحالة الاتيه : 
    ''';
  }
}
