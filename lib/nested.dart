import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Severproducts> fetchSeverproducts() async {
  final response =
      await http.get('https://onyx.demo.co.zm/api/v1/product/list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print('Name ${products.prodName}');
    return Severproducts.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Severproducts {
  final int status;
  final List<Products> products;

  Severproducts({this.status, this.products});
  factory Severproducts.fromJson(Map<String, dynamic> json) => Severproducts(
        status: json["status"],
        products: List<Products>.from(
            json["products"].map((x) => Products.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Products {
  String prodStatus;
  String id;
  String prodName;
  String prodDescription;
  int prodCost;
  String createdBy;
  String updatedAt;
  int v;
  Products({
    this.prodStatus,
    this.id,
    this.prodName,
    this.prodDescription,
    this.prodCost,
    this.createdBy,
    this.updatedAt,
    this.v,
  });
  factory Products.fromJson(Map<String, dynamic> json) => Products(
      prodStatus: json["prodStatus"],
      id: json["_id"],
      prodName: json["prodName"],
      prodDescription: json['prodDescription'],
      prodCost: json["prodCost"],
      createdBy: json["createdBy"],
      updatedAt: json["updatedAt"],
      v: json["__v"]);
  Map<String, dynamic> toJson() => {
        "prodStatus": prodStatus,
        "__id": id,
        "prodName": prodName,
        "prodDescription": prodDescription,
        "prodCost": prodCost,
        "createdBy": createdBy,
        "updatedAt": updatedAt,
        "__v": v
      };
}
// Future<String> _loadProductAsset() async {
//   return await rootBundle.loadString('assets/product.json');
// }

// Future loadProduct() fetchloadProductAsset() async {
//   String jsonProduct = await _loadProductAsset();
//   final jsonResponse = json.decode(jsonProduct);
//   Product product = new Product.fromJson(jsonResponse);
//   print(product.images[0].imageName);
//}

// {
//     "status": 200,
//     "message": "Customer found",
//     "customer": {
//         "resetPasswordToken": "Null",
//         "sysRole": "customer",
//         "custStatus": "Active",
//         "_id": "5ea9cfaded991a5656d2189c",
//         "custFirstname": "Alfie",
//         "custLastname": "tim",
//         "custEmail": "alfeyokatebe@gmail.com",
//         "custPhone": 2222,
//         "custHomeAddress": "Bongohive",
//         "custWorkAddress": "Bongohive",
//         "custPassword": "$2a$12$sE6LzXus7nN0eOLSkNsL1uKbxtnrwWocB0OM5BrTt9avHZaBd568e",
//         "custDateOfBirth": "25578",
//         "custOccupation": "developer",
//         "createdAt": "2020-04-29T19:04:13.149Z",
//         "updatedAt": "2020-05-07T00:01:37.247Z",
//         "__v": 0,
//         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWE5Y2ZhZGVkOTkxYTU2NTZkMjE4OWMiLCJpYXQiOjE1ODg4MDk2OTd9.wEZFtp0cr39XtCbMzyYXUVJLXYC378OGMRQYvNeIWO8"
//     }
// }
