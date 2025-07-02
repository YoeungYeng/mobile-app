class Category {
  int? status;
  String? message;
  List<Data>? data;

  Category({this.status, this.message, this.data});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      status: json['status'],
      message: json['message'],
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => Data.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class Data {
  int? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
