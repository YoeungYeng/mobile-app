class Category_Details {
  int? status;
  String? message;
  List<Data>? data;

  Category_Details({this.status, this.message, this.data});

  Category_Details.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? title;
  String? content;
  int? categoryId;
  String? description;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  Category? category;

  Data(
      {this.id,
        this.title,
        this.content,
        this.categoryId,
        this.description,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    categoryId = json['category_id'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }
}

class Category {
  int? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
