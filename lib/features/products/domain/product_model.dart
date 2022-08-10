import 'package:garden_of_eve/features/products/domain/discount_model.dart';
import 'package:intl/intl.dart';

class Product {
  int id;
  String name;
  String description;
  String sunlight;
  String watering;
  String lifespan;
  String size;
  List<String> category;
  int qty;
  double price;
  String imgDirectory;
  String imgUrl;
  String imgCredit;
  DateTime createdAt;
  DateTime modifiedAt;
  Discount? discount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.sunlight,
    required this.watering,
    required this.lifespan,
    required this.size,
    required this.category,
    required this.qty,
    required this.price,
    required this.imgDirectory,
    required this.imgUrl,
    required this.imgCredit,
    required this.createdAt,
    required this.modifiedAt,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    Discount? discountInfo;
    if (json['discount'] != null) {
      discountInfo = Discount.fromJson(json['discount']);
    }
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      sunlight: json['sunlight'] as String,
      watering: json['watering'] as String,
      lifespan: json['lifespan'] as String,
      size: json['size'] as String,
      category: List<String>.from(json['category']),
      qty: json['qty'] as int,
      price: json['price'].toDouble(),
      imgDirectory: json['img_directory'] as String,
      imgUrl: json['img_url'] as String,
      imgCredit: json['img_credit'] as String,
      createdAt: DateTime.parse(json['created_at']),
      modifiedAt: DateTime.parse(json['modified_at']),
      discount: discountInfo,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'sunlight': sunlight,
        'watering': watering,
        'lifespan': lifespan,
        'size': size,
        'category': category,
        'qty': qty,
        'price': price,
        'img_directory': imgDirectory,
        'img_url': imgUrl,
        'img_credit': imgCredit,
        'created_at': createdAt,
        'modified_at': modifiedAt,
        'discount': discount,
      };

  @override
  String toString() {
    return '\nname: $name, createdAt: ${DateFormat.yMMMMd().format(createdAt)} ${DateFormat.jm().format(createdAt)}, '
        'modifiedAt: ${DateFormat.yMMMM().format(modifiedAt)} ${DateFormat.jm().format(modifiedAt)}';
  }

  double get getPrice {
    if (discount != null) {
      double discounted = price * (discount!.discountPercent / 100);
      return price - discounted;
    }
    return price;
  }
}
