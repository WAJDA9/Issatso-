class Course {
  final String name;
  final String url;
  final String publishdate;
  Course(this.name, this.url, this.publishdate,);

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['name'],
      json['url'],
      json['publishdate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'publishdate': publishdate,
      };
  
  @override
  String toString() {
    return 'Course{name: $name, url: $url, publishdate: $publishdate}';
  }
  
}