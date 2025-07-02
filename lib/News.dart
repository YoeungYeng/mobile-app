class News {
  int? status;
  String? message;
  List<Data2>? data;

  News({this.status, this.message, this.data});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      status: json['status'],
      message: json['message'],
      data:
      json['data'] != null
          ? List<Data2>.from(json['data'].map((v) => Data2.fromJson(v)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data2 {
  int? id;
  String? title;
  String? content;
  int? categoryId;
  String? description;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data2({
    this.id,
    this.title,
    this.content,
    this.categoryId,
    this.description,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    categoryId = json['category_id'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
