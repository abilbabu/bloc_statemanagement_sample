// To parse this JSON data, do
//
//     final fakestoremodel = fakestoremodelFromJson(jsonString);

import 'dart:convert';

List<Fakestoremodel> fakestoremodelFromJson(String str) => List<Fakestoremodel>.from(json.decode(str).map((x) => Fakestoremodel.fromJson(x)));

String fakestoremodelToJson(List<Fakestoremodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fakestoremodel {
    int? id;
    String? title;
    double? price;
    String? description;
    String? category;
    String? image;
    Rating? rating;

    Fakestoremodel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });

    factory Fakestoremodel.fromJson(Map<String, dynamic> json) => Fakestoremodel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
    };
}

class Rating {
    double? rate;
    int? count;

    Rating({
        this.rate,
        this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
