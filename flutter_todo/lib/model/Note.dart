class Note {
  String id;
  String title;
  String content;
  bool isChecked;

  Note({this.id, this.title, this.content, this.isChecked});

  /// Config to compare object
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          id == other.id &&
          title == other.title &&
          content == other.content &&
          isChecked == other.isChecked;

  /// Config to compare object
  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ content.hashCode ^ isChecked.hashCode;

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isChecked = json['is_checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['is_checked'] = this.isChecked;
    return data;
  }
}
