class Note {
  String id;
  String title;
  String content;
  bool isChecked;

  Note({this.id, this.title, this.content,this.isChecked});

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
