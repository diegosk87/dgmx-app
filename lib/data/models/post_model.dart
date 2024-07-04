class PostModel {
  PostModel({
    this.id,
    this.slug,
    this.url,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.status,
    this.category,
    this.publishedAt,
    this.updatedAt,
    this.userId,
  });

  final String? id;
  final String? slug;
  final String? url;
  final String? title;
  final String? content;
  final String? image;
  final String? thumbnail;
  final String? status;
  final String? category;
  final String? publishedAt;
  final String? updatedAt;
  final String? userId;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'].toString(),
    slug: json['slug'].toString(),
    url: json['url'].toString(),
    title: json['title'].toString(),
    content: json['content'].toString(),
    image: json['image'].toString(),
    thumbnail: json['thumbnail'].toString(),
    status: json['status'].toString(),
    category: json['category'].toString(),
    publishedAt: json['publishedAt'].toString(),
    updatedAt: json['updatedAt'].toString(),
    userId: json['userId'].toString(),
  );
}