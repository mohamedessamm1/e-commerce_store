class AddProducts {
  String? category;
  String? describtion;
  String? image;
  String? name;
  String? price;
  double? rate;
  double? totalrate;
  bool? incart;

  AddProducts({
    this.category,
    this.describtion,
    this.price,
    this.rate,
    this.image,
    this.name,
    this.totalrate,
    this.incart,
  });

  AddProducts.fromjson(Map<String, dynamic> json) {
    category = json?['category'];

    describtion = json?['describtion'];
    price = json?['price'];
    rate = json?['rate'];
    image = json?['image'];
    totalrate = json?['totalrate'];
    name = json?['name'];
    incart = json?['incart'];
  }

  Map<String, dynamic> tojson() {
    return {
      'describtion': describtion,
      'category': category,
      'price': price,
      'rate': rate,
      'image': image,
      'totalrate': totalrate,
      'name': name,
      'incart': incart,
    };
  }
}
