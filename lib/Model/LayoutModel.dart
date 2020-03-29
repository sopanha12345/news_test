class LayoutModel {
  final image;
  final title;
  final article;
  final source;
  final duration;

  LayoutModel({
      this.image,
      this.title,
      this.article,
      this.source,
      this.duration,
  });

  factory LayoutModel.fromJson(Map<String, dynamic>jsonData){
    return LayoutModel(
      image: jsonData['image'],
      title: jsonData['title'],
      article: jsonData['article'],
      source: jsonData['source'],
      duration: jsonData['duration']
    );
  }
}