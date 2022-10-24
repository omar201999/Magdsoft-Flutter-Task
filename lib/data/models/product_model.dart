class ProductModel {
  int? status;
  String? message;
  List<Products>? products;

  ProductModel({this.status, this.message, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }


}

class Products {
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  Products(
      {this.id,
        this.company,
        this.name,
        this.type,
        this.price,
        this.image,
        this.description});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

}