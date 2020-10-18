class Product {
  int id;
  String productName;
  String productCategory;
  String price;
  String imgUrl;

  Product({
    this.id,
    this.productName,
    this.productCategory,
    this.price,
    this.imgUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        productCategory: json["productCategory"],
        price: json["price"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productCategory": productCategory,
        "price": price,
        "imgUrl": imgUrl,
      };
}
