class ProcheaPreyHttp{
  final Title title;
  final Content content;
  final Excerpt excerpt;
  final String fimg_url;

  ProcheaPreyHttp({
    this.title,
    this.content,
    this.fimg_url,
    this.excerpt
  });

  factory ProcheaPreyHttp.fromJson(Map<String, dynamic> json){
    return new ProcheaPreyHttp(
      fimg_url: json['fimg_url'],
      title:Title.fromJson(json['title']),
      content:Content.fromJson(json['content']),
      excerpt: Excerpt.fromJson(json['excerpt'])
    );
  }
}

class Title{
  final String rendered;

  Title({
    this.rendered
  });

  factory Title.fromJson(Map<String, dynamic> json){
    return new Title(
      rendered: json['rendered'],
    );
  }
}

class Content{
  final String rendered;

  Content({
    this.rendered
  });

  factory Content.fromJson(Map<String, dynamic> json){
    return new Content(
      rendered: json['rendered']
    );
  }
}


class Excerpt{
  final String rendered;

  Excerpt({
    this.rendered
});

  factory Excerpt.fromJson(Map<String, dynamic>json){
    return new Excerpt(
      rendered: json['rendered']
    );
  }
}