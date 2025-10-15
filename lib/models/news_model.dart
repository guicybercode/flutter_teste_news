class News {
  final String id;
  final String title;
  final String content;
  final String summary;
  final String categoryId;
  final DateTime publishedAt;
  final String imageUrl;
  final String author;
  bool isSaved;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.summary,
    required this.categoryId,
    required this.publishedAt,
    required this.imageUrl,
    required this.author,
    this.isSaved = false,
  });

  News copyWith({
    String? id,
    String? title,
    String? content,
    String? summary,
    String? categoryId,
    DateTime? publishedAt,
    String? imageUrl,
    String? author,
    bool? isSaved,
  }) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      summary: summary ?? this.summary,
      categoryId: categoryId ?? this.categoryId,
      publishedAt: publishedAt ?? this.publishedAt,
      imageUrl: imageUrl ?? this.imageUrl,
      author: author ?? this.author,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}



